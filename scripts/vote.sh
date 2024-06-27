APP_NAME="elections_voting" # Replace with current program name

VOTER="aleo1x75.."
VOTER_PK="APrivateKey1zkp6Y.."

VOTERS_CANDIDATE="aleo154ktx..."

# Vote for the candidate
leo execute vote "${VOTERS_CANDIDATE}" --network testnet --private-key "${VOTER_PK}" --program "${APP_NAME}" --broadcast



