# Airdrop ERC-721 Contract

This smart contract facilitates the distribution of ERC-721 tokens to specified recipients. It allows the contract owner to distribute ERC-721 tokens to multiple addresses.

## Features

- Distribution of ERC-721 tokens to recipients.
- Ownership control to ensure secure distribution.

## Getting Started

These instructions will help you deploy the contract and distribute ERC-721 tokens.

### Prerequisites

- A development environment with Solidity.
- An Ethereum wallet with ERC-721 tokens for distribution.

### Deployment

1. Deploy the `Airdrop` contract to the Ethereum blockchain, specifying the address of the ERC-721 token to be distributed during deployment.
2. Make note of the contract address after deployment.

### Interacting with the Contract

![Screenshot 2023-10-30 131708](https://github.com/Areeba000/ERC721-contract/assets/140241495/29aab01d-48fa-43e2-9535-02eda4583e25)

1. Distribute ERC-721 Tokens:
   - Call the `distributeTokens` function, providing the recipient's address and the token ID to distribute.
   - The specified ERC-721 token will be transferred from your address to the recipient's address.

2. Ownership Control:
   - Only the owner of the contract can initiate the token distribution.
   - Ensure that you are the owner or have the necessary permissions to execute the distribution.

## Security Considerations

- Only the contract owner can distribute tokens. Ensure that the owner's address is secure and has the appropriate permissions.
- Verify the recipient addresses to avoid transferring tokens to unintended addresses.
- Perform testing and auditing to ensure secure distribution.

