// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Airdrop is Ownable {
    IERC721 public tokenid; // The ERC-20 token to be distributed
    event TokensDistributed(address indexed recipient, uint256 tokenId);

    constructor(address _tokenid) {
        tokenid = IERC721(_tokenid);
    }

    function distributeTokens(address recipient, uint256 tokenId) external onlyOwner {
        tokenid.transferFrom(msg.sender, recipient, tokenId);
        emit TokensDistributed(recipient, tokenId);
    }  
}
