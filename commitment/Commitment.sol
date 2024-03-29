// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

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
     *
     * @param hash the hash to commit.
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
     * Pay out if the sender can prove knowledge of the commited hash preimage.
     *
     * @param preimage the preimage that hashes to the commitment.
     */
    function payout(string memory preimage) public
    {
        require(commitment == sha256(bytes(preimage)));
        payable(msg.sender).transfer(address(this).balance);
    }
}
