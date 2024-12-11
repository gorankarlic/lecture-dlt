// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "./Flashloan.sol";

contract TestBorrower is Borrower
{
    function execute(address payable lender) external payable
    {
        require(msg.value == 1e18, "must receive flashloan");
        lender.transfer(msg.value);
    }
}