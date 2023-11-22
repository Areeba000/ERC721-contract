// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "hardhat/console.sol";

contract NFTMarketplace is Ownable, IERC721Receiver {
    using SafeMath for uint256;

    IERC721 public nftToken;
    uint256 public listingFee=3;
    IERC20 public feeToken;

    struct Listing {
        address seller;
        uint256 tokenId;
        uint256 price;
        bool active;
    }

    mapping(uint256 => Listing) public listings;
    

    event NFTListed(uint256 indexed tokenId, uint256 price, address seller);
    event NFTSold(uint256 indexed tokenId, address buyer);

    constructor(address _nftToken) {
        nftToken = IERC721(_nftToken);  
    }

    function listNFT(uint256 _tokenId, uint256 _price, address _feeToken) external {
        feeToken = IERC20(_feeToken);
        require(nftToken.ownerOf(_tokenId) == msg.sender, "Not the owner of the NFT");
        require(nftToken.getApproved(_tokenId) == address(this), "Marketplace not approved to transfer NFT");

        nftToken.safeTransferFrom(msg.sender, address(this), _tokenId);
        listings[_tokenId] = Listing({
            seller: msg.sender,
            tokenId: _tokenId,
            price: _price,
            active: true
        });

        emit NFTListed(_tokenId, _price, msg.sender);
    }

    function buyNFT(uint256 _tokenId) external {
        Listing storage listing = listings[_tokenId];
        require(listing.active, "Listing is not active");

        uint256 totalAmountPaid = listing.price.add((listing.price.mul(listingFee)).div(100));

        require(feeToken.balanceOf(msg.sender) >= totalAmountPaid, "Insufficient ERC-20 funds");

        nftToken.safeTransferFrom(address(this), msg.sender, listing.tokenId);
        listing.active = false;

        // Transfer fee and payment in ERC-20 tokens
        require(feeToken.transferFrom(msg.sender, owner(), listing.price.mul(listingFee).div(100)), "Fee transfer failed");
        require(feeToken.transferFrom(msg.sender, listing.seller, listing.price), "Payment transfer failed");

        emit NFTSold(_tokenId, msg.sender);
    }
    function setListingFee(uint256 _listingFee) external onlyOwner {
        listingFee = _listingFee;
    }
    function onERC721Received(address, address, uint256, bytes calldata) external pure override returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }
}
