// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex3_12 {
    uint public a = 4;
    function myFun() 
        public 
        view 
        returns(uint) {
            uint b = a + 5;
            return b;
        }
}