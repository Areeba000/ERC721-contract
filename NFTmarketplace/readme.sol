# NFT Marketplace Contract

This is a Solidity smart contract for a simple NFT marketplace implemented on the Ethereum blockchain. The marketplace allows users to list and buy NFTs using an ERC-20 token as the payment method.

## Getting Started

### Prerequisites

- [Remix IDE](https://remix.ethereum.org/): Online Solidity IDE for smart contract development.
- [Metamask](https://metamask.io/): A cryptocurrency wallet and gateway to blockchain apps.

### Installation

1. Open Remix IDE in your web browser.
2. Copy and paste the contract code from `NFTMarketplace.sol` into a new file in Remix.

## Usage

1. Deploy the contract:
   - Make sure you are connected to the Ethereum network using Metamask.
   - Click on the "Solidity Compiler" tab and compile the contract.
   - Switch to the "Deploy & Run Transactions" tab.
   - Deploy the contract by selecting the contract and clicking "Deploy."

2. Interact with the contract:
   - Use the contract functions through the Remix interface.
   - Make sure you have the necessary permissions (e.g., ownership) to list and buy NFTs.

## Contract Functions

### `listNFT(uint256 _tokenId, uint256 _price, address _feeToken) external`

Lists an NFT for sale on the marketplace.

- Parameters:
  - `_tokenId`: ID of the NFT to be listed.
  - `_price`: Price of the NFT in ERC-20 tokens.
  - `_feeToken`: Address of the ERC-20 token used for the listing fee.

### `buyNFT(uint256 _tokenId) external`

Allows a user to purchase an NFT from the marketplace.

- Parameters:
  - `_tokenId`: ID of the NFT to be purchased.

### `setListingFee(uint256 _listingFee) external onlyOwner`

Sets the listing fee percentage. Only the owner can call this function.

## Events

- `NFTListed(uint256 indexed tokenId, uint256 price, address seller)`: Triggered when an NFT is listed on the marketplace.
- `NFTSold(uint256 indexed tokenId, address buyer)`: Triggered when an NFT is successfully sold.


