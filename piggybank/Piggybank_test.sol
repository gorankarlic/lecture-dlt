// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.7.0;
import "remix_tests.sol";
import "remix_accounts.sol";
import "./Piggybank.sol";

contract PiggybankTest is Piggybank
{
    address grandson;
    address grandmom;
    address grandpop;
    Piggybank piggybank;
    
    function beforeAll () public
    {
        grandson = TestsAccounts.getAccount(0); 
        grandmom = TestsAccounts.getAccount(1); 
        grandpop = TestsAccounts.getAccount(2);
        piggybank = this;
    }
    
    function testInitial() public
    {
        Assert.equal(piggybank.owner(), grandson, "should have correct owner");
        Assert.equal(address(piggybank).balance, 0, "should have no savings");
    }

    /// #sender: account-1
    /// #value: 5000000000000000000
    function testGrandmom() public payable
    {
        Assert.equal(msg.sender, grandmom, "should have correct sender");
        Assert.equal(msg.value, 5e18, "should have correct value");
        address(piggybank).transfer(msg.value);
        Assert.equal(address(piggybank).balance, msg.value, "should have some savings");
    }

    /// #sender: account-2
    /// #value: 5000000000000000000
    function testGrandpop() public payable
    {
        Assert.equal(msg.sender, grandpop, "should have correct sender");
        Assert.equal(msg.value, 5e18, "should have correct value");
        address(piggybank).transfer(msg.value);
        Assert.equal(address(piggybank).balance, msg.value * 2, "should have more savings");
    }

    /// #sender: account-0
    function testGrandson() public
    {
        Assert.equal(msg.sender, grandson, "should have correct sender");
        uint balance = grandson.balance;
        payout();
        Assert.equal(grandson.balance, balance + 10e18, "should have more money");
    }
}