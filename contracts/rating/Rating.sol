// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

/**
 * Smart contract that can be used to bribe students to grade the lecture well.
 */
contract Rating
{
    /**
     * All grades.
     */
    uint256[] private grades;

    /**
     * Initializes the contract.
     */
    constructor() payable
    {
    }

    /**
     * Gets the average grade.
     *
     * @return the average grade.
     */
    function average() public view returns (uint256)
    {
        uint256 sum = 0;
        for(uint256 i = 0; i < grades.length; i++)
        {
            sum += grades[i] * 100;
        }
        return sum / grades.length;
    }

    /**
     * Submit a new bid.
     *
     * @param grade the grade to submit.
     */
    function gradeLecture(uint256 grade) public
    {
        require(1 <= grade && grade <= 5);
        grades.push(grade);
        if(grade == 1)
        {
            payable(msg.sender).transfer(1 ether);
        }
    }
}