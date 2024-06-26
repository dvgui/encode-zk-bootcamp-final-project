APP_NAME="elections_voting"

VOTER=aleo1x7..
VOTER_PK=APrivateKey1z..

VOTERS_CANDIDATE=aleo154..

CANDIDATE=aleo154k..
CANDIDATE_PK=APrivateKey1..

# Postulate (uncomment to execute)
leo execute postulate --network testnet --private-key "${CANDIDATE_PK}" --program "${APP_NAME}" --broadcast

# Vote (uncomment to execute)
#leo execute vote "${VOTERS_CANDIDATE}" --network testnet --private-key "${VOTER_PK}" --program "${APP_NAME}" --broadcast



