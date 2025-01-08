// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";
import "remix_tests.sol";
import "remix_accounts.sol";
import "./Layer2.sol";

contract Layer2Test
{
    address account = TestsAccounts.getAccount(1);
    uint256 balance = account.balance;

    Layer2 l2 = new Layer2(msg.sender);
    Layer1 l1 = new Layer1(l2);

    /// #sender: account-1
    /// #value: 10000000000000000000
    function testExchange() public payable
    {
        l2.setOwner(address(l1));        
        l1.lock{value: 5000000000000000000}();
        Assert.equal(l2.balance(account), 5000000000000000000, "should have correct balance");
        Assert.equal(address(l1).balance, 5000000000000000000, "should have correct balance");
        
        l1.unlock(5000000000000000000);
        Assert.equal(l2.balance(account), 0, "should have correct balance");
        Assert.equal(address(l1).balance, 0, "should have correct balance");
    }
}