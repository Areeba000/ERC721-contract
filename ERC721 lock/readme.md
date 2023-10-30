# Token Locker Contract README

This document provides an overview of the `tokenlocker` contract, which is designed to allow users to lock and unlock ERC-721 tokens. It enables users to deposit tokens into the contract for safekeeping and later retrieve them.

## Table of Contents

1. **Introduction**
   - Purpose of the Contract
   - ERC-721 Standard

2. **Contract Structure**
   - Locking and Unlocking Tokens
   - Storage

3. **Usage**
   - Locking Tokens
   - Unlocking Tokens
   - Checking if Tokens are Locked

4. **Security Considerations**
   - Access Control
   - Safe Transfer

5. **Getting Started**
   - Deployment
   - Interacting with the Contract


## 1. Introduction

### Purpose of the Contract

The `tokenlocker` contract serves as a mechanism for users to lock and unlock ERC-721 tokens on the Ethereum blockchain. By locking tokens in this contract, users can temporarily store their tokens in a secure manner. The contract is designed to facilitate controlled access to the tokens, ensuring that only the token owner can unlock and retrieve them.

![Screenshot 2023-10-30 115331](https://github.com/Areeba000/ERC721-contract/assets/140241495/1afcb827-d820-448c-b710-27eb7c3e51a5)


### ERC-721 Standard

The contract leverages the ERC-721 standard, which is widely used for non-fungible tokens (NFTs) on the Ethereum blockchain. ERC-721 tokens represent ownership of unique digital or physical assets, collectibles, and more.

## 2. Contract Structure

### Locking and Unlocking Tokens

The `tokenlocker` contract allows users to lock and unlock ERC-721 tokens. When tokens are locked, they are transferred from the user's address to the contract's address. The contract keeps track of the locked token balances for each user.

### Storage

Token balances and ownership are stored in the contract's state variables, specifically the `lockedTokens` mapping, which records the balance of locked tokens for each user and token contract.

## 3. Usage

### Locking Tokens

To lock ERC-721 tokens, users can call the `locktoken` function, specifying the token contract address and the amount of tokens to lock.

```solidity
function locktoken(address tokenContract, uint256 tokenamount) public
```

- `tokenContract`: The address of the ERC-721 token contract to lock tokens from.
- `tokenamount`: The amount of tokens to lock.

### Unlocking Tokens

To unlock and retrieve locked tokens, users can call the `unlocktoken` function, specifying the token contract address and the amount of tokens to unlock.

```solidity
function unlocktoken(address tokenContract, uint256 tokenamount) public
```

- `tokenContract`: The address of the ERC-721 token contract to unlock tokens to.
- `tokenamount`: The amount of tokens to unlock.

### Checking if Tokens are Locked

The `istokenLocked` function allows users to check if they have any tokens locked within the contract.

```solidity
function istokenLocked(address tokenContract, address owner) public view returns (bool)
```

- `tokenContract`: The address of the ERC-721 token contract to check.
- `owner`: The address of the token owner to check for locked tokens.

## 4. Security Considerations

### Access Control

The contract should be used with proper access control mechanisms to ensure that only authorized users can lock and unlock tokens. Implement access controls to prevent unauthorized access.

### Safe Transfer

The contract uses the `transferFrom` function to move tokens. Ensure that the ERC-721 token contract and the `tokenlocker` contract have proper approval mechanisms in place for successful token transfers.

## 5. Getting Started

### Deployment

To deploy the `tokenlocker` contract, you can use tools like Remix, Truffle, or Hardhat. Deploy the contract to the Ethereum network and make note of its address.

### Interacting with the Contract

Users can interact with the `tokenlocker` contract by calling the provided functions. Lock tokens when needed and unlock them when you want to retrieve them. Make sure to have the required approvals set for token transfers.

