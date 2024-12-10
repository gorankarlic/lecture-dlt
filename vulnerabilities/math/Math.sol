// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Smart contract with a re-entrancy vulnerability.
 */
contract Math
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
     * Distributes the balance between the recipients.
     *
     * @param recipients the list of recipients.
     */
    function distribute(address payable[] memory recipients) public
    {
        uint256 fraction = address(this).balance / recipients.length;
        balances[msg.sender] = 0;
        for(uint256 n = 0; n < recipients.length; n++)
        {
            recipients[n].transfer(fraction);
        }
    }
}