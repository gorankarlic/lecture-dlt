// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Time locked contract where the owner can change only after a delay.
 */
contract Timelock
{
    /**
     * Approximate number of blocks in one week (assuming a 30 second block time).
     */
    uint256 public constant NUMBER_OF_BLOCKS_IN_ONE_WEEK = 7 * 24 * 60 * 60 / 30;

    /**
     * Contract owner.
     */
    address public owner;

    /**
     * Subsequent owner.
     */
    address public subsequent;

    /**
     * Block number at which subsequent owner can become the contract owner.
     */
    uint256 public timelock;

    /**
     * Creates a new contract.
     */
    constructor()
    {
        owner = payable(msg.sender);
        subsequent = owner;
    }

    /**
     * Initiates the contract ownership transfer.
     *
     * @param subsequent_ the subsequent contract owner.
     */
    function transferInitiate(address subsequent_) external 
    {
        require(msg.sender == owner);
        timelock = block.number + 2;//NUMBER_OF_BLOCKS_IN_ONE_WEEK;
        subsequent = subsequent_;
    }

    /**
     * Finalizes the contract ownership transfer if the time lock has expired. 
     */
    function transferFinalize() external
    {
        require(timelock <= block.number);
        owner = subsequent;
    }
}