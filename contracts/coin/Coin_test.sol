// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "remix_tests.sol";
import "./Coin.sol";

contract CoinTest
{
    Coin coin;
    
    function beforeAll () public
    {
        coin = new Coin();
    }
    
    function checkSymbol() public
    {
        Assert.equal(coin.name(), "WHU", "name should be WHU");
    }
}