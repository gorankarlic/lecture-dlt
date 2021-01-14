// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.7.0;
import "remix_tests.sol";
import "./Voting.sol";

contract VotingTest
{
    Voting voting;
    
    function beforeAll () public
    {
        voting = new Voting();
    }
    
    function testVote() public
    {
        voting.vote(true);
        Assert.equal(voting.voted(address(this)), true, "vote was recorded");
        Assert.equal(voting.count(), 1, "vote was recorded");
    }
}