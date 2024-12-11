// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";
import "remix_tests.sol";
import "remix_accounts.sol";
import "./Reserve.sol";

contract TestOracle is Oracle
{
    function price() external pure returns (uint256)
    {
        return 10e18;
    }
}

contract ReserveTest is Reserve 
{
    address backer;
    address buyer;

    constructor() Reserve(new TestOracle())
    {
    }

    function beforeAll() public
    {
        backer = TestsAccounts.getAccount(0);
        buyer = TestsAccounts.getAccount(1);
    }

    /// #sender: account-0
    /// #value: 1000000000000000000
    function testBacker() public payable
    {
        Assert.equal(msg.sender, backer, "should have correct sender");
        Assert.equal(msg.value, 1e18, "should have correct value");
        payable(address(this)).transfer(msg.value);
        Assert.equal(address(this).balance, msg.value, "should have correct reserve");
    }

    /// #sender: account-1
    /// #value: 1000000000000000000
    function testBuy() public payable
    {
        Assert.equal(msg.sender, buyer, "should have correct sender");
        Assert.equal(msg.value, 1e18, "should have correct value");
        buy();
        Assert.equal(balance[buyer], 10e18, "should have correct balance");
    }

    /// #sender: account-1
    function testSell() public
    {
        uint256 initial = buyer.balance;
        Assert.equal(msg.sender, buyer, "should have correct sender");
        sell(5e18);
        Assert.equal(balance[buyer], 5e18, "should have correct stablecoin balance");
        Assert.equal(buyer.balance, initial + 5e17, "should have correct Ether balance");
    }
}