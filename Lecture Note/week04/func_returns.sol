// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_3 {
    uint public a = 3;
    uint public b = 5;

    function myFun() public returns(uint, uint){
        a = 100;
        b = 0;
        return (a,b);
    }
}