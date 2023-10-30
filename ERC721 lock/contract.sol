// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract tokenlocker {
    mapping(address => mapping(address => uint256)) public lockedTokens;
    
    function locktoken(address tokenContract, uint256 tokenamount) public {
        IERC721(tokenContract).transferFrom(msg.sender, address(this), tokenamount);
        lockedTokens[tokenContract][msg.sender] += tokenamount;
    }

    function unlocktoken(address tokenContract, uint256 tokenamount) public {
        require(lockedTokens[tokenContract][msg.sender] >= tokenamount, "not enough locked");
        IERC721(tokenContract).transferFrom(address(this), msg.sender, tokenamount);
        lockedTokens[tokenContract][msg.sender] -= tokenamount;
    }

    function istokenLocked(address tokenContract, address owner) public view returns (bool) {
        return lockedTokens[tokenContract][owner] > 0;
    }
}
