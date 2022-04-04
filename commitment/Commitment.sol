// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

/**
 * Demonstrates a hash commitment proof.
 */
contract Commitment
{
    /**
     * Commited hash.
     */
    bytes32 public commitment;
    
    /**
     * Creates a new contract.
     */
    constructor(bytes32 hash)
    {
        commitment = hash;
    }

    /**
     * Accept payments.
     */
    function pay() external payable
    {
    }

    /**
     * Payout if the sender can proove knowledge of pre-image.
     */
    function payout(string memory preimage) public
    {
        require(commitment == sha256(bytes(preimage)));
        payable(msg.sender).transfer(address(this).balance);
    }
}
