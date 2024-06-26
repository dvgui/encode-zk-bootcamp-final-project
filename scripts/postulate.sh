APP_NAME="elections_voting"

CANDIDATE=aleo154k..
CANDIDATE_PK=APrivateKey1..=

# Postulate
leo execute postulate --network testnet --private-key "${CANDIDATE_PK}" --program "${APP_NAME}" --broadcast


