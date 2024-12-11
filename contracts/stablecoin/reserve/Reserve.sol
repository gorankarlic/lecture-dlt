// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Ethereum price oracle.
 */
interface Oracle
{
    /**
     * Gets the price of 1 Ether in the pegged currency (e.g. fractional USD).
     *
     * @return the price of 1 Ether in the pegged currency (e.g. fractional USD).
     */
    function price() external view returns (uint256);
}

/**
 * Stablecoin backed by an internal Ether reserve.
 */
contract Reserve
{
    /**
     * Stablecoin balance for each address.
     */
    mapping(address => uint256) balance;

    /**
     * Ether price oracle.
     */
    Oracle public oracle;

    /**
     * Creates a new contract.
     *
     * @param oracle_ the ether price oracle.
     */
    constructor(Oracle oracle_)
    {
        oracle = oracle_;
    }

    /**
     * Increases the Ether backing reserve.
     */
    receive() external payable
    {
    }

    /**
     * Buy stablecoins for Ether.
     */
    function buy() public payable
    {
        balance[msg.sender] += (oracle.price() * 1 ether) / msg.value;
    }

    /**
     * Sell stablecoins for Ether.
     *
     * @param amount the amount of stablecoins to sell.
     */
    function sell(uint256 amount) public
    {
        require(balance[msg.sender] >= amount, "insufficient funds");
        balance[msg.sender] -= amount;
        payable(msg.sender).transfer((amount * 1 ether) / oracle.price());
    }

    /**
     * Transfer stablecoins to another account.
     *
     * @param recipient the recipient account.
     * @param amount the amount to transfer.
     */
    function transfer(address recipient, uint256 amount) public
    {
        require(balance[msg.sender] >= amount, "insufficient funds");
        balance[msg.sender] -= amount;
        balance[recipient] += amount;
    }
}