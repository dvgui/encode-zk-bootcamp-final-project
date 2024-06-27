APP_NAME="elections_voting" # Replace with current program name

CANDIDATE=aleo154k..
CANDIDATE_PK=APrivateKey1..

# Postulate as a candidate
leo execute postulate --network testnet --private-key "${CANDIDATE_PK}" --program "${APP_NAME}" --broadcast


