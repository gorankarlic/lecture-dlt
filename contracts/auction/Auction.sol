// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Smart contract for an open ascending price auction.
 */
contract Auction
{
    /**
     * Last bid amount.
     */
    uint256 private lastBidAmount;

    /**
     * Last bid block number.
     */
    uint256 private lastBidBlockNumber;

    /**
     * Last bidder account address.
     */
    address payable private lastBidder;

    /**
     * Seller account address.
     */
    address payable private seller;

    /**
     * Initializes the contract.
     */
    constructor(address payable seller_)
    {
        seller = seller_;
    }

    /**
     * Submit a new bid.
     */
    function bid() external payable
    {
        require(msg.value > lastBidAmount);
        address payable previousBidder = lastBidder;
        uint256 previousBidAmount = lastBidAmount;
        lastBidAmount = msg.value;
        lastBidBlockNumber = block.number;
        lastBidder = payable(msg.sender);
        if(previousBidder != address(0))
        {
            (bool ok, ) = previousBidder.call{value: previousBidAmount}("");
            require(ok);
        }
    }

    /**
     * Closes the auction.
     */
    function close() external payable
    {
        require(lastBidBlockNumber > 0 && lastBidBlockNumber + 2 < block.number);
        (bool ok, ) = seller.call{value: address(this).balance}("");
        require(ok);
    }
}