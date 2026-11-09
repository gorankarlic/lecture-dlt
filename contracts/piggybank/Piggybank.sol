// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Piggybank contract that allows spending if savings are >= 1 ETH
 */
contract Piggybank
{
    /**
     * Contract owner.
     */
    address payable public owner;

    /**
     * Creates a new contract.
     */
    constructor()
    {
        owner = payable(msg.sender);
    }

    /**
     * Accept payments.
     */
    receive() external payable
    {
    }

    /**
     * Empty the Piggybank by transferring saved funds to owner.
     */
    function payout() public payable
    {
        require(msg.sender == owner);
        require(address(this).balance >= 1 ether);
        (bool ok, ) = owner.call{value: address(this).balance}("");
        require(ok);
    }
}