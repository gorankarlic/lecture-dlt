// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

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
    constructor()
    {
        owner = payable(msg.sender);
    }

    /**
     * Accept payments.
     */
    function pay() external payable
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
