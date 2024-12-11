// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";
import "remix_tests.sol";
import "remix_accounts.sol";
import "./Flashloan.sol";
import "./TestBorrower.sol";

contract FlashloanTest
{
    Borrower borrower = new TestBorrower();
    Flashloan flashloan = new Flashloan();

    /// #sender: account-0
    /// #value: 1000000000000000000
    function testFund() public payable
    {
        Assert.equal(msg.value, 1e18, "should have correct value");
        payable(address(flashloan)).transfer(msg.value);
        Assert.equal(address(flashloan).balance, 1e18, "should have correct balance");
    }

    /// #sender: account-1
    function testLend() public
    {
        flashloan.execute(borrower);
        Assert.equal(address(flashloan).balance, 1e18, "should have correct balance");
    }
}