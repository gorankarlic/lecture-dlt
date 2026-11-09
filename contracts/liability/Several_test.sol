// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";
import "remix_accounts.sol";
import "remix_tests.sol";
import "./Several.sol";

contract SeveralTest is Several
{
    address creditor;
    address signatoryA;
    address signatoryB;

    function beforeAll () public
    {
        creditor = TestsAccounts.getAccount(0);
        signatoryA = TestsAccounts.getAccount(1);
        signatoryB = TestsAccounts.getAccount(2);
    }
    
    constructor() Several(testSignatories())
    {
    }

    function testSignatories() internal pure returns (address[] memory)
    {
        address[] memory signatories = new address[](2);
        signatories[0] = TestsAccounts.getAccount(1); 
        signatories[1] = TestsAccounts.getAccount(2); 
        return signatories;
    }

    /// #sender: account-0
    /// #value: 2000000000000000000
    function testLend() public payable
    {
        Assert.equal(msg.sender, creditor, "should have correct sender");
        Assert.equal(address(this).balance, 2 ether, "should have correct credit");
    }

    /// #sender: account-1
    function testSignA() public
    {
        Assert.equal(msg.sender, signatoryA, "should have correct sender");
        sign();
    }

    /// #sender: account-2
    function testSignB() public payable
    {
        Assert.equal(msg.sender, signatoryB, "should have correct sender");
        sign();
    }

    /// #sender: account-1
    function testWithdraw() public payable
    {
        Assert.equal(msg.sender, signatoryA, "should have correct sender");
        uint256 initial = address(msg.sender).balance;
        withdraw();
        Assert.equal(address(signatoryA).balance, initial + 2 ether, "should be credited");
        Assert.equal(debt[signatoryA], 1 ether, "should owe proportional debt");
        Assert.equal(debt[signatoryB], 1 ether, "should owe proportional debt");
    }

    /// #sender: account-1
    /// #value: 1000000000000000000
    function testRepay() public payable
    {
        Assert.equal(msg.sender, signatoryA, "should have correct sender");
        Assert.equal(msg.value, 1 ether, "should send 1 ether");
        repay(signatoryA);
        Assert.equal(debt[signatoryA], 0, "should have repaid debt");
        Assert.equal(debt[signatoryB], 1 ether, "should have unchanged debt");
    }
}