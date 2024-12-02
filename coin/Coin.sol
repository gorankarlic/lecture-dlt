// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

/**
 * ERC20 coin contract.
 *
 * A simple coin.
 */
contract Coin is ERC20
{
    /**
     * Initializes the contract.
     */
    constructor() ERC20("WHU", "WHU")
    {
    }
}
