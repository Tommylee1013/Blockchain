// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex3_4 {
    uint public a = 3;
    function myFunc(uint b, uint c, uint d) public {
        a = b;
        a = c;
        a = d;
    }
}