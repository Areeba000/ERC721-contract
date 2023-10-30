# ICO and NFT Contracts

This repository contains two contracts: an ICO (Initial Coin Offering) contract and an NFT (Non-Fungible Token) contract. The ICO contract allows users to purchase tokens in exchange for Ether (ETH) and receive NFTs in return. The NFT contract manages the creation and minting of NFTs.

## ICO Contract

### Features

- Users can participate in the ICO by sending ETH and receive tokens in exchange.
- The ICO has a predefined rate, duration, and hard cap for fundraising.
- The contract owner can withdraw funds and change the token rate.

### Deployment

To deploy the ICO contract, you need to provide the following parameters:

- Rate: The number of tokens received per ETH.
- DurationInDays: The number of days for the ICO to run.
- EthHardCap: The maximum amount of ETH that can be raised.
- MyNFT Address: The address of the MyNFT contract to interact with.

### Functions

- `buyTokens()`: Allows users to participate in the ICO by sending ETH.

- ![Screenshot 2023-10-30 170613](https://github.com/Areeba000/ERC721-contract/assets/140241495/4377d582-df13-45f6-b631-63e1e989c910)

- `withdrawFunds()`: Allows the contract owner to withdraw ETH funds.

- ![Screenshot 2023-10-30 170710](https://github.com/Areeba000/ERC721-contract/assets/140241495/c9974f58-e73c-4e2c-966c-a00e55ff1389)

- `changeRate()`: Allows the contract owner to change the token rate.

## NFT Contract

### Features

- The NFT contract manages the creation and minting of NFTs.
- Users can mint NFTs, and the contract owner can add addresses allowed to mint NFTs.

### Deployment

The NFT contract is a simple implementation of ERC-721. It does not require deployment parameters.

![Screenshot 2023-10-30 170603](https://github.com/Areeba000/ERC721-contract/assets/140241495/2c74dfa8-0109-4afc-b26d-4f4cb14b24a6)


### Functions

- `nftmint(address _to)`: Allows users with permission to mint NFTs and assigns them to the specified address.
- `addaddress(address _allowedperson)`: Allows the contract owner to add addresses that have permission to mint NFTs.

## Getting Started

1. Deploy the NFT contract, which is a prerequisite for the ICO contract.
2. Deploy the ICO contract, providing the required parameters, including the address of the NFT contract.
3. Set the ICO rate, duration, and hard cap.
4. Users can participate in the ICO by sending ETH to the contract.
5. Users will receive tokens and corresponding NFTs based on the ICO rate.
   
![Screenshot 2023-10-30 170554](https://github.com/Areeba000/ERC721-contract/assets/140241495/f93368b3-2278-478d-90c2-4e346224e846)

