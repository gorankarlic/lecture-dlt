// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Layer exchange oracle.
 */
interface L2
{
    /**
     * Burns the layer-2 coins that should be unlocked on the layer-1 blockchain.
     *
     * @param account the account to debit.
     * @param amount the amount to burn.
     */
    function burn(address account, uint256 amount) external;

    /**
     * Mints the layer-2 coins that have been locked on the layer-1 blockchain.
     *
     * @param account the account to credit.
     * @param amount the amount to mint.
     */
    function mint(address account, uint256 amount) external;
}

/**
 * Layer-1 contract.
 */
contract Layer1
{
    /**
     * Layer-2 oracle.
     */
    L2 public l2;

    /**
     * Creates a new contract.
     *
     * @param l2_ the layer-2 exchange oracle.
     */
    constructor(L2 l2_)
    {
        l2 = l2_;
    }

    /**
     * Locks the layer-1 coins and mints the same amount on the layer-2 blockchain.
     */
    function lock() external payable
    {
        require(address(l2) != address(0), "layer-2 oracle must be set");
        l2.mint(tx.origin, msg.value);
    }

    /**
     * Unlocks the layer-1 coins by burning the same amount on the layer-2 blockchain.
     *
     * @param amount the amount to redeem.
     */
    function unlock(uint256 amount) external
    {
        require(address(l2) != address(0), "layer-2 oracle must be set");
        l2.burn(tx.origin, amount);
        payable(tx.origin).transfer(amount);
    }
}

/**
 * Layer-2 contract.
 */
contract Layer2 is L2
{
    /**
     * Address balances.
     */
    mapping(address => uint256) public balance;

    /**
     * Contract owner.
     */
    address public owner;

    /**
     * Creates a new contract.
     *
     * @param owner_ the contract owner.
     */
    constructor(address owner_)
    {
        owner = owner_;
    }

    function burn(address account, uint256 amount) external
    {
        require(msg.sender == owner, "must be called by contract owner");
        require(amount >= balance[account], "insufficient balance");
        balance[account] -= amount;
    }

    function mint(address account, uint256 amount) external
    {
        require(msg.sender == owner, "must be called by contract owner");
        balance[account] += amount;
    }

    /**
     * Sets the contract owner.
     *
     * @param owner_ the new contract owner.
     */
    function setOwner(address owner_) external
    {
        require(owner == address(0), "contract owner already set");
        owner = owner_;
    }
}