// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

// TokenSwap contract for swapping tokens between two parties.
contract TokenSwap {
    IERC721 public token1; // The first ERC20 token.
    IERC721 public token2; // The second ERC20 token.
    address public owner1; // The address of the owner of token1.
    address public owner2; // The address of the owner of token2.

    // Constructor to initialize the contract with token addresses and owners.
    constructor(address _token1, address _owner1, address _token2, address _owner2) {
        token1 = IERC721(_token1);
        owner1 = _owner1;
        token2 = IERC721(_token2);
        owner2 = _owner2;
    }

    // Swap tokens between owner1 and owner2.

   function swap(uint256 _tokenId1, uint256 _tokenId2) public {
       require(msg.sender == owner1 || msg.sender == owner2, "Not authorized");
       require(token1.ownerOf(_tokenId1) == owner1, "Token 1 not owned by owner1");
       require(token2.ownerOf(_tokenId2) == owner2, "Token 2 not owned by owner2");
    
       token1.transferFrom(owner1, owner2, _tokenId1);
       token2.transferFrom(owner2, owner1, _tokenId2);
}

    
}
