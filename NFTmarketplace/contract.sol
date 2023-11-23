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

    uint256 public listingFee=3;
    uint256 public oderID;

    struct Listing {
        //uint256 orderID;
        address seller;
        uint256 tokenId;
        uint256 price;
        bool active;
        IERC721 Nftcollection;
       
    }

    mapping(uint256 => Listing) public listings;
   
    event NFTListed(uint256 indexed tokenId, uint256 price, address seller);
    event NFTSold(uint256 indexed tokenId, address buyer);
  
    function listNFT(uint256 _tokenId, uint256 _price,IERC721 _Nftcollection ) external {
        oderID++;
       _Nftcollection.safeTransferFrom(msg.sender, address(this), _tokenId);
        listings[oderID] = Listing({
            seller: msg.sender,
            tokenId: _tokenId,
            price: _price,
            active: true,
            Nftcollection:IERC721(_Nftcollection)
        });

        emit NFTListed(_tokenId, _price, msg.sender);
    }

    function buyNFTwithOrderID(uint256 _orderID,address _feeToken) external {

        require(listings[_orderID].active, "Listing is not active");
        IERC721 nftCollection = IERC721(listings[_orderID].Nftcollection);
        nftCollection.safeTransferFrom(address(this), msg.sender, listings[ _orderID].tokenId);
        listings[ _orderID].active = false;
        IERC20 feeToken = IERC20(_feeToken);

        require( feeToken.transferFrom(msg.sender, owner(), listings[_orderID].price.mul(listingFee).div(100)), "Fee transfer failed");
        require( feeToken.transferFrom(msg.sender, listings[_orderID].seller, listings[_orderID].price), "Payment transfer failed");
        
        emit NFTSold(_orderID, msg.sender);
    }
    
    function buyNFT(uint256 _orderID) external payable {
    require(listings[_orderID].active, "Listing is not active");
    IERC721 nftCollection = IERC721(listings[_orderID].Nftcollection);
    nftCollection.safeTransferFrom(address(this), msg.sender, listings[_orderID].tokenId);

    uint256 fee = listings[_orderID].price.mul(listingFee).div(100);
    require(payable(owner()).send(fee), "Fee transfer failed");
    require(payable(listings[_orderID].seller).send(listings[_orderID].price.sub(fee)), "Payment transfer failed");

    listings[_orderID].active = false;

    emit NFTSold(_orderID, msg.sender);
}
    function setListingFee(uint256 _listingFee) external onlyOwner {
        listingFee = _listingFee;
    }
    
    function onERC721Received(address, address, uint256, bytes calldata) external pure override returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }
}
