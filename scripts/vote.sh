APP_NAME="elections_voting"

VOTER=aleo1x7..
VOTER_PK=APrivateKey1z..

VOTERS_CANDIDATE=aleo154..

# Vote (uncomment to execute)
leo execute vote "${VOTERS_CANDIDATE}" --network testnet --private-key "${VOTER_PK}" --program "${APP_NAME}" --broadcast



