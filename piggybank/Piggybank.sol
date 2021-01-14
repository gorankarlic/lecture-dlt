// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.7.0;

/**
 * Piggybank contract that allows spending if savings are > 1 ETH
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
    constructor() public
    {
        owner = msg.sender;
    }

    /**
     * Accept payments.
     */
    receive() external payable
    {
    }

    /**
     * Empty the Piggybank by transering saved funds out owner.
     */
    function payout() public
    {
        require(msg.sender == owner);
        require(address(this).balance >= 1 ether);
        owner.transfer(address(this).balance);
    }
}