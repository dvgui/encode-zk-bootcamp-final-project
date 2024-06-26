# FinalProject - Anonymous Voting System using Aleo Protocol

## Introduction

Welcome to the Anonymous Voting System, a decentralized application built on the Aleo protocol. This system leverages the power of zero-knowledge proofs to ensure that votes are cast and counted in a secure, private, and verifiable manner. By using the Aleo protocol, we can provide a voting solution that maintains the confidentiality of each vote while ensuring the integrity and transparency of the overall election process.

This project is the final project of the ZK Bootcamp Q2 2024, showcasing the practical application of zero-knowledge proofs learned during the bootcamp.

## Key Features

- Postulate as a candidate
- Vote anonymously only once

## Deploy

Make sure to fund the leo wallet before deploying <https://www.leo.app/blog/aleo-faucet>.

```bash
leo deploy --network testnet
```

Use <https://explorer.aleo.org> to view deployment transaction details

## Try out

Replace variables with content and run script

### Vote

```bash
. ./vote.sh
```

### Postulate

```bash
. ./postulate.sh
```

## Limitations encountered

- The vsCode extension seems to be using an older version of the leo language so it lints the syntax like `async` or suggest using `finalize` when this seems to be no longer supported.

- The language seems very restrictive imo, so we struggled when trying to include features like tally votes or others because we couldn't easily iterate. Maybe this is intended for the purpose of the programs logic.
