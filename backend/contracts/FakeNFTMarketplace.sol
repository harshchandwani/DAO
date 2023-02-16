// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract FakeNFTMarketplace {
    /// @dev Maintain a mapping of Fake TokenID to Owner addresses
    mapping(uint256 => address) public tokens;
    /// @dev Set the purchase price for each Fake NFT
    uint256 nft_price = 0.1 ether;

    /// @dev purchase() accepts ETH and marks the owner of the given tokenId as the caller address
    /// @param _tokenId - the fake NFT token Id to purchase
    function purchase(uint256 _tokenId) external payable {
        require(msg.value == nft_price, "This NFT costs 0.1 ether");
        tokens[_tokenId] = msg.sender;
    }

    /// @dev getPrice() returns the price of one NFT
    function getPrice() external view returns (uint256) {
        return nft_price;
    }

    function available(uint256 _tokenId) external view returns (bool) {
        // address(0) = 0x0000000000000000000000000000000000000000
        // This is the default value for addresses in Solidity
        if (tokens[_tokenId] == address(0)) {
            return true;
        }
        return false;
    }
}