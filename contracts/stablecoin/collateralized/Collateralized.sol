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
 * Collateralized stablecoin backed by an internal Ether reserve.
 */
contract Collateralized
{
    /**
     * Collateralized debt position.
     */
    struct CDP
    {
        /**
         * Collateral balance.
         */
        uint256 balance;

        /**
         * Minted stablecoins.
         */
        uint256 minted;
    }

    /**
     * Collateralization ratio.
     */
    uint256 constant public RATIO = 2;

    /**
     * Stablecoin balance for each address.
     */
    mapping(address => uint256) public balance;

    /**
     * Collateralized debt position for each borrower.
     */
    mapping(address => CDP) public collateral;

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
     * Borrow stablecoins against Ether collateral.
     */
    function borrow() public payable
    {
        uint256 amount = (oracle.price() * 1 ether) / (msg.value * RATIO);
        balance[msg.sender] += amount;
        CDP storage cdp = collateral[msg.sender];
        cdp.balance += msg.value;
        cdp.minted += amount;
    }

    /**
     * Redeem collateral by returning the borrowed stablecoins.
     */
    function redeem() public
    {
        CDP memory cdp = collateral[msg.sender];
        require(balance[msg.sender] >= cdp.minted, "insufficient funds");
        balance[msg.sender] -= cdp.minted;
        collateral[msg.sender] = CDP(0, 0);
        payable(msg.sender).transfer(cdp.balance);
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