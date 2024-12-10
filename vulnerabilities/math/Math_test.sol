// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "remix_tests.sol";
import "remix_accounts.sol";
import "./Math.sol";

contract MathTest
{
    Math math;
    address recipient1;
    address recipient2;

    function beforeAll () public
    {
        math = new Math();
        recipient1 = TestsAccounts.getAccount(1);
        recipient2 = TestsAccounts.getAccount(2);
    }

    /// #sender: account-0
    /// #value: 1000000000000000000
    function testIssue() public payable
    {
        (bool success, ) = payable(math).call{value: 3}("");
        require(success, "Transfer failed.");

        Assert.equal(address(math).balance, 19, "should have 19 wei");
 
        uint256 balance1 = recipient1.balance;
        uint256 balance2 = recipient2.balance;
        address payable[] memory recipients = new address payable[](2);
        recipients[0] = payable(recipient1); 
        recipients[1] = payable(recipient2);
        math.distribute(recipients);
        Assert.equal(recipient1.balance, balance1 + 1, "should have 1 more wei");
        Assert.equal(recipient2.balance, balance2 + 1, "should have 1 more wei");
    }
}