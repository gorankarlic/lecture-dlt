// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Flashloan borrower.
 */
interface Borrower
{
    /**
     * Receives and returns the flashloan.
     *
     * @param lender the flashloan address to which to return funds.
     */
    function execute(address payable lender) external payable;
}

/**
 * Flashloan contract that lends and collects within the same transaction.
 */
contract Flashloan
{
    /**
     * Creates a new contract.
     */
    constructor()
    {
    }

    /**
     * Fund the contract / return a flashloan.
     */
    receive() external payable
    {
    }

    /**
     * Execute a flashloan.
     *
     * @param borrower the borrower contract.
     */
    function execute(Borrower borrower) public
    {
        uint256 balance = address(this).balance;
        borrower.execute{value: balance}(payable(address(this)));
        require(address(this).balance == balance, "funds must be returned immediately");
    }
}