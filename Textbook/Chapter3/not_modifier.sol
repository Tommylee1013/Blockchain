// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex3_14 {

    uint public a = 3;
    function myFun()
    public 
    returns(uint) {
        a = 4;
        return a;
    }
}