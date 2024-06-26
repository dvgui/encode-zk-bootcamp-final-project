program elections_voting.aleo {

    mapping voter_participation: address => bool;
    mapping candidate_votes: address => u64;
    mapping winner: field => address;
    const winnerKey: field = 0field;

    async transition vote(private candidate: address) -> Future {
        return update_votes(candidate, self.caller);
    }

    async transition postulate() -> Future {
        return update_candidates(self.caller);
    }

    async transition tally() -> Future {
        return get_winner();
    }

    async function get_winner()  {
        Mapping::get(winner, winnerKey);
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
        // disallow voting again
        Mapping::set(voter_participation, voter, true);

        // get current votes for candidate and update them
        let current_votes: u64 = Mapping::get_or_use(candidate_votes, voted_candidate, 0u64);
        Mapping::set(candidate_votes, voted_candidate, current_votes + 1u64);  
        // get current winner - or set as voted candidate
        let winner_candidate : address = Mapping::get_or_use(winner, winnerKey, voted_candidate);
        // if the candidate is the same and winning do nothing, if not check difference
        if (winner_candidate != voted_candidate){
            // cache winner votes
            let winner_votes: u64 = Mapping::get(candidate_votes, winner_candidate);
            if (current_votes > winner_votes) {
                Mapping::set(winner, winnerKey, voted_candidate);
            }
        }
    }
}
