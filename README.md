# Final Project - Private Voting System using Aleo Protocol

## Summary

A Private Voting program built using Leo on the [Aleo protocol](https://aleo.org). This program leverages the power of zero-knowledge proofs to ensure that votes are cast and counted in a secure, private, and verifiable manner.

By using the Aleo protocol, we can provide a voting solution that maintains the confidentiality of each vote while ensuring the integrity and transparency of the overall election process.

This project is the final project of the ZK Bootcamp Q2 2024, showcasing the practical application of zero-knowledge proofs learned during the bootcamp.

## Features

- Postulate as a candidate
- Vote anonymously only once

## Try out

Use <https://explorer.aleo.org> to view deployment transaction details

**Important**: Replace variables with correct inputs of your wallet before running scripts.

### Prerequisites

- Install Leo, Rust, SnarkOS <https://developer.aleo.org/leo/installation#1-install-the-prerequisites>
- Make sure to fund the leo wallet <https://www.leo.app/blog/aleo-faucet>.


### Deploy

```bash
leo deploy --network testnet
```

### Vote

You can only vote once, and the candidate must be postulated, otherwise the execution will fail.

```bash
. ./scripts/vote.sh
```

### Postulate

You can only postulate once, otherwise the execution will fail.

```bash
. ./scripts/postulate.sh
```

## Demo examples

- Deployed program: <https://explorer.aleo.org/transaction/at1fy5gg6npv47hyqnmwj3aajlsre0k8nd5k23a26ucktkrvv087cyslfh3me>

![Deployed Program Broadcast example](./docs/deployed-example.png)

- Postulate: <https://explorer.aleo.org/transaction/at1t40h9y4mqw3grpxjehhquj0329ck7vkpycuw537pmxm87ekz5ypsk2n2s7>

- Vote: <https://explorer.aleo.org/transaction/at10y86kvnu74h08uykgq0z43vcmfwdqd68cxg6aa9ahg4mcvzgfvzssdcz2r>

![Vote tx example](./docs/vote-tx-example.png)

- Duplicated vote constraint

![Duplicate vote example](./docs/duplicate-vote.png)

- Duplicated postulation constraint

![Duplicate postulation example](./docs/duplicate-postulate.png)

## Limitations encountered

- The vsCode extension seems to be using an older version of the leo language so it lints the syntax like `async` or suggest using `finalize` when this seems to be no longer supported.

- The language seems very restrictive, so struggled when trying to include features like tally votes or others because we couldn't easily iterate. Maybe this is intended for the purpose of the program's logic.
