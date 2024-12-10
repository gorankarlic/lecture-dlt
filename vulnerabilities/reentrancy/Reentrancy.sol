// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Smart contract with a reentrancy vulnerability.
 */
contract Reentrancy
{
    /**
     * Balance for each account.
     */
    mapping(address => uint256) public balances;

    /**
     * Tops up the account.
     */
    receive() external payable
    {
        balances[msg.sender] += msg.value;
    }

    /**
     * Transfers the balance from one account to another.
     *
     * @param recipient the recipient address.
     */
    function transfer(address payable recipient) public
    {
        recipient.call{value: balances[msg.sender]}("");
        balances[msg.sender] = 0;
    }
}