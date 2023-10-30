// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


interface MyNFT is IERC721 {
    function nftmint(address _to) external;
}

 contract ICO is Ownable {
    MyNFT public myNFT; // The ERC-721 token being sold
    uint256 public rate; // Number of tokens received per ETH
    uint256 public endTime; // ICO end timestamp
    uint256 public hardCap; // Maximum amount to be raised in ETH
    uint256 public raisedAmount; // Amount of ETH raised

    event TokensPurchased(address indexed buyer, uint256 ethAmount, uint256 tokenAmount);
    event ICOFinalized(uint256 totalTokensSold, uint256 totalETHRaised);

    constructor(uint256 _rate, uint256 _durationInDays, uint256 _ethHardCap, address myNft) {
        myNFT = MyNFT(myNft);
        rate = _rate;
        endTime = block.timestamp + _durationInDays * 1 days;
        hardCap = _ethHardCap * 1 ether;
        raisedAmount = 0;
    }

    function buyTokens() public  payable {
        require(block.timestamp <= endTime, "ICO has ended");
        uint256 ethAmount = msg.value;
        uint256 tokensToBuy = ethAmount / (10**18) * rate;
        require(tokensToBuy > 0, "No tokens to buy");
        require(raisedAmount + ethAmount <= hardCap, "Hard cap reached");

        raisedAmount += ethAmount;

        // Mint NFTs and transfer them to the buyer
        for (uint256 i = 0; i < tokensToBuy; i++) {
            myNFT.nftmint(msg.sender);
        }

        emit TokensPurchased(msg.sender, ethAmount, tokensToBuy);
    }

    function withdrawFunds() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function changeRate(uint256 newRate) external onlyOwner {
        rate = newRate;
    }
}
