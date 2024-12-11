// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "remix_tests.sol";
import "remix_accounts.sol";
import "./Timelock.sol";

contract TimelockTest
{
    Timelock fixture;
    address subsequent;

    function beforeAll () public
    {
        subsequent = TestsAccounts.getAccount(0);
        fixture = new Timelock();
    }

    function testTransferInitiate() public payable
    {
        Assert.equal(fixture.owner(), address(this), "should have correct owner");
        fixture.transferInitiate(subsequent);
        Assert.equal(fixture.owner(), address(this), "should have unchanged owner");
        Assert.equal(fixture.subsequent(), subsequent, "should have correct subsequent owner");
        Assert.equal(fixture.timelock(), block.number + 2, "should have correct timelock");
    }

    function testTransferFinalize_Fail() public payable
    {
        try fixture.transferFinalize()
        {
            Assert.ok(false, "should fail");
        }
        catch Error(string memory reason)
        {
            Assert.equal(reason, "Expected revert message", "Unexpected revert reason.");
        }
        catch(bytes memory)
        {
            Assert.equal(fixture.owner(), address(this), "should have unchanged owner");
        }
    }

    /// #sender: account-0
    function testTransferFinalize_OK() public payable
    {
        fixture.transferFinalize();
        Assert.equal(fixture.owner(), subsequent, "should have changed owner");
    }
}