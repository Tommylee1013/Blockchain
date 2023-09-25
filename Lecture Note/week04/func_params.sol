// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_2 {
    uint public a = 3;
    function myFun(uint b, uint c, uint d) public {
        a = b;
        a = c;
        a = d;
    }
}