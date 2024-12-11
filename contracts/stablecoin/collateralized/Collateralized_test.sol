// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";
import "remix_tests.sol";
import "remix_accounts.sol";
import "./Collateralized.sol";

contract TestOracle is Oracle
{
    function price() external pure returns (uint256)
    {
        return 10e18;
    }
}

contract CollateralizedTest is Collateralized 
{
    address borrower;

    constructor() Collateralized(new TestOracle())
    {
    }

    function beforeAll() public
    {
        borrower = TestsAccounts.getAccount(0);
    }

    /// #sender: account-0
    /// #value: 1000000000000000000
    function testBorrow() public payable
    {
        Assert.equal(msg.sender, borrower, "should have correct sender");
        Assert.equal(msg.value, 1e18, "should have correct value");
        borrow();
        Assert.equal(balance[borrower], 5e18, "should have correct balance");
    }

    /// #sender: account-0
    function testRedeem() public payable
    {
        uint256 initial = borrower.balance;
        Assert.equal(msg.sender, borrower, "should have correct sender");
        redeem();
        Assert.equal(balance[borrower], 0, "should have correct balance");
        Assert.equal(borrower.balance, initial + 1e18, "should have correct Ether balance");
        Assert.equal(collateral[borrower].balance, 0, "should have correct collateral balance");
        Assert.equal(collateral[borrower].minted, 0, "should have correct collateral mint");
    }
}