program elections_voting.aleo {
    const MAX_CANDIDATES: u8 = 2u8;

    struct Candidate {
        id: address,
        voteCount: u64
    }

    mapping voter_participation: address => bool;
    mapping candidate_votes: address => u64;
    mapping candidates: u8 => Candidate;

    async transition vote(private candidate_id: u8) -> Future {
        return update_votes(candidate_id, self.caller);
    }

    async transition postulate() -> Future {
        return update_candidates(self.caller);
    }

    async transition tally_votes () -> Future {
        return get_winner();
    }

    async function get_winner() {
        let winner_id: u8 = 0u8;
        let max_votes: u64 = 0u64;

        for i: u8 in 0u8..MAX_CANDIDATES {
            let candidate_info: Candidate = Mapping::get(candidates, i);

            max_votes = (candidate_info.voteCount > max_votes) ? candidate_info.voteCount : max_votes;
            winner_id = (candidate_info.voteCount == max_votes) ? i : winner_id;
        }

        Mapping::get(candidates, winner_id);
    }

    async function update_candidates(candidate: address) {
        let already_postulated: bool = Mapping::contains(candidate_votes, candidate);

        assert(!already_postulated);

        Mapping::set(candidate_votes, candidate, 0u64);
    }

    async function update_votes(candidate_id: u8, voter: address) {
        let voted: bool = Mapping::contains(voter_participation, voter);
        let candidate_postulated: bool = Mapping::contains(candidates, candidate_id);

        assert(!voted);
        assert(candidate_postulated);

        Mapping::set(voter_participation, voter, true);

        let candidate_info: Candidate = Mapping::get(candidates, candidate_id);

        let current_votes: u64 = candidate_info.voteCount;

        let updated_votes: u64 = current_votes + 1u64;

        let updated_candidate_votes: Candidate = Candidate {
            id: candidate_info.id,
            voteCount: updated_votes
        };

        Mapping::set(candidates, candidate_id, updated_candidate_votes);   
    }
}
