# TokenSwap Smart Contract

The TokenSwap contract allows two parties to swap tokens between each other.

## Overview

This smart contract facilitates the swapping of tokens between two parties, each holding ownership of a specific ERC721 token. It checks ownership and authorization before executing the swap to ensure the security of the transaction.

## Usage

Before deploying the TokenSwap contract, you should have the following information ready:

- Address of the first ERC721 token (Token 1).
- Address of the owner of Token 1.
  
![Screenshot 2023-10-30 180551](https://github.com/Areeba000/ERC721-contract/assets/140241495/13da8d83-82c2-461f-b2e1-5e2a38a9eab3)

- Address of the second ERC721 token (Token 2).
  
- ![Screenshot 2023-10-30 180559](https://github.com/Areeba000/ERC721-contract/assets/140241495/095c997a-8edc-43b4-8a63-48cf2086c1b4)

- Address of the owner of Token 2.

### Constructor

- `constructor(address _token1, address _owner1, address _token2, address _owner2)`: Initializes the contract with the addresses of the two ERC721 tokens and their respective owners.

- ![Screenshot 2023-10-30 180605](https://github.com/Areeba000/ERC721-contract/assets/140241495/76282875-a156-4222-8e78-bf58e5a7f63d)


### Swap Function

- `swap(uint256 _tokenId1, uint256 _tokenId2)`: This function allows authorized users to swap tokens between the owner of Token 1 and the owner of Token 2. It verifies that the sender is either owner1 or owner2, and that the respective tokens are owned by the correct parties. If the conditions are met, the swap is executed.

 ![Screenshot 2023-10-30 180537](https://github.com/Areeba000/ERC721-contract/assets/140241495/649451ec-32dd-4cad-bd74-422b46f55931)

### Error Handling

The contract includes error handling to ensure that tokens are only swapped when the specified conditions are met. Unauthorized access, incorrect ownership, or other issues will result in a transaction being reverted.

## Security Considerations

Make sure to:

- Verify that the contract addresses and ownership are set correctly during deployment.
- Ensure that only authorized parties are allowed to initiate swaps.
- Review the error messages and conditions to understand why a transaction might be reverted.


