// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Promissory note with joint liability.
 */
contract Joint
{
    /**
     * Outstanding debt for each signatory.
     */
    uint256 public debt;

    /**
     * Signature provided for each signatory.
     */
    mapping(address => bool) public signed;

    /**
     * Promissory note signatories.
     */
    address[] public signatories;

    /**
     * Creates a new contract.
     *
     * @param signatories_ the promissory note signatories.
     */
    constructor(address[] memory signatories_) payable
    {
        require(msg.value % signatories_.length == 0);
        for(uint n = 0; n < signatories_.length; n++)
        {
            signatories.push(signatories_[n]);
        }
    }

    /**
     * Accept payment of the partial or full outstanding from anyone.
     */
    receive() external payable
    {
        require(debt >= msg.value, "only accepts outstanding debt for beneficiary");
        debt -= msg.value;
    }

    /**
     * Sign the promisory note.
     */
    function sign() public
    {
        signed[msg.sender] = true;
    }

    /**
     * Withdraw the credited amount.
     */
    function withdraw() public
    {
        bool signatory = false;
        for(uint n = 0; n < signatories.length; n++)
        {
            require(signed[signatories[n]], "all signatories must have signed");
            signatory = signatory || signatories[n] == msg.sender;
        }
        require(signatory, "only a signatory can withdraw the credit");
        debt = address(this).balance;
        payable(msg.sender).transfer(address(this).balance);
    }
}