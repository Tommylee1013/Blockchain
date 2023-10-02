// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_25 {
    function fun1(uint a)
        public 
        pure 
        returns(uint) {
            if(a > 3) {
                a = 9;
            } else {
                a = 10;
            }
            return a;
        }
}