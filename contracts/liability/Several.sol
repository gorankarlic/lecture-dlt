// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Promissory note with several liability.
 */
contract Several
{
    /**
     * Outstanding debt for each signatory.
     */
    mapping(address => uint256) public debt;

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
     * Accept payment of the proportional outstanding debt for the beneficiary.
     *
     * @param beneficiary the repayment beneficiary.
     */
    function repay(address beneficiary) public payable
    {
        require(debt[beneficiary] == msg.value, "only accepts outstanding debt for beneficiary");
        debt[beneficiary] = 0;
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
        uint256 proportion = address(this).balance / signatories.length;
        for(uint n = 0; n < signatories.length; n++)
        {
            debt[signatories[n]] = proportion;
        }
        payable(msg.sender).transfer(address(this).balance);
    }
}