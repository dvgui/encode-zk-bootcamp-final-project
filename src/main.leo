program elections_voting_axm8kq_1.aleo {

    mapping voter_participation: address => bool;
    mapping candidate_votes: address => u64;

    async transition vote(private candidate: address) -> Future {
        return update_votes(candidate, self.caller);
    }

    async transition postulate() -> Future {
        return update_candidates(self.caller);
    }

    async function update_candidates(candidate: address) {
        let already_postulated: bool = Mapping::contains(candidate_votes, candidate);

        assert(!already_postulated);

        Mapping::set(candidate_votes, candidate, 0u64);
    }

    async function update_votes(voted_candidate: address, voter: address) {
        let voted: bool = Mapping::contains(voter_participation, voter);
        let candidate_postulated: bool = Mapping::contains(candidate_votes, voted_candidate);

        assert(!voted);
        assert(candidate_postulated);

        Mapping::set(voter_participation, voter, true);

        let current_votes: u64 = Mapping::get(candidate_votes, voted_candidate);
        Mapping::set(candidate_votes, voted_candidate, current_votes + 1u64);   
    }
}
