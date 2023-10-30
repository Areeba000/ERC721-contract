# SimpleStaking ERC-721 Staking Contract

This smart contract allows users to stake ERC-721 tokens (NFTs) and subsequently unstake them. Users receive an equivalent amount of ERC-721 tokens when they unstake. The contract uses SafeMath for secure mathematical operations and complies with the ERC-721 token receiving interface.

## Features

- Staking of ERC-721 tokens.
- Unstaking of staked tokens.
- Secure mathematical operations using SafeMath.
- ERC-721 token receiving functionality.

## Getting Started

These instructions will help you deploy the contract and interact with it.

### Prerequisites

- A development environment with Solidity.
- An Ethereum wallet to interact with the contract.

### Deployment

1. Deploy the `SimpleStaking` contract to the Ethereum blockchain, specifying the ERC-721 token to be staked during deployment.
2. Make note of the contract address after deployment.

### Interacting with the Contract

![Screenshot 2023-10-30 124303](https://github.com/Areeba000/ERC721-contract/assets/140241495/ebd3c732-03b8-458f-9830-a70b1adebbd9)


1. Stake ERC-721 Tokens:
   - Call the `stakeNFT` function and provide the ID of the ERC-721 token you wish to stake.
   - The selected ERC-721 token will be transferred from your address to the contract's address.
   - You will be considered a staker.

2. Unstake ERC-721 Tokens:
   - Call the `unstake` function to retrieve your staked ERC-721 tokens.
   - The staked ERC-721 tokens will be transferred back to your address from the contract.
   - Your staking balance will be set to zero.

3. Check Staking Status:
   - Use the `istokenstake` function to check if an address is a staker (i.e., has a non-zero staking balance).

## Security Considerations

- Ensure that the contract deployment and interactions are done securely.
- Consider adding access control mechanisms to restrict functions to specific roles or users.
- Perform thorough testing and auditing before deploying to a live network.
