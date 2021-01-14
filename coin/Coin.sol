// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

/**
 * ERC20 coin contract.
 *
 * A simple coin.
 */
contract Coin is ERC20
{
    /**
     * Created a coin.
     */
    event Coined(string indexed symbol);

    /**
     * Initializes the contract.
     */
    constructor() ERC20("WHU", "WHU") public
    {
        emit Coined("WHU");
    }
}