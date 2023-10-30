# MyNFT - ERC-721 Token Smart Contract

## Introduction

MyNFT is an Ethereum-based smart contract that implements the ERC-721 standard for non-fungible tokens (NFTs). This contract allows users to create and manage unique, indivisible tokens. Each token can represent ownership of a unique digital or physical asset, such as digital art, collectibles, or real estate.

## Key Features

### 1. ERC-721 Compliance

MyNFT fully complies with the ERC-721 standard, ensuring compatibility with various NFT marketplaces and applications.

![Screenshot 2023-10-30 111331](https://github.com/Areeba000/ERC721-contract/assets/140241495/105ed59e-c7a6-425a-8f90-5c35197ca944)


### 2. Minting

Users can mint (create) new NFTs by specifying the recipient's address and the unique token ID. Minting is the process of creating new NFTs.

![Screenshot 2023-10-30 111920](https://github.com/Areeba000/ERC721-contract/assets/140241495/f7fd601e-4ef4-41ac-bd06-d95e46ec551d)


### 3. Burning

Token owners can burn (destroy) NFTs that they own, effectively removing them from existence.

![Screenshot 2023-10-30 112133](https://github.com/Areeba000/ERC721-contract/assets/140241495/b411e9a0-13dd-433c-9b77-77babab3d4a2)


### 4. Transfers

NFTs can be transferred between addresses, enabling the buying, selling, and trading of these unique assets.

### 5. Approvals and Operator Authorization

The contract supports granting approval to specific addresses for transferring tokens on behalf of the owner. Additionally, owners can authorize operators to manage their tokens.

## Usage

### Minting a New NFT

To create a new NFT, call the `mint` function with the recipient's address and a unique token ID.

```solidity
function mint(address to, uint id) external;
```

### Burning an NFT

Token owners can burn their NFTs using the `burn` function.

```solidity
function burn(uint id) external;
```

### Transferring Tokens

To transfer tokens from one address to another, use the `transferFrom` or `safeTransferFrom` functions.

### Approvals and Operator Authorization

- Approvals can be set using the `approve` function, allowing a specific address to transfer a token on behalf of the owner.
- Operator authorizations can be granted using the `setApprovalForAll` function, enabling operators to manage a user's tokens.

## Events

The contract emits events to provide transparency and keep track of important actions:

- `Transfer`: Emitted when a token is transferred from one address to another.
- `Approval`: Emitted when approval is granted for a specific address to manage a token.
- `ApprovalForAll`: Emitted when an owner authorizes or revokes an operator's permission to manage their tokens.


