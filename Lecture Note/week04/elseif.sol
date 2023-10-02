// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_26 {
    function fun1(uint a)
        public 
        pure 
        returns(uint) {
            if(a >= 10) {
                a = 9;
            } else if (a >= 5 && a <= 7) {
                a = 7;
            } else {
                a = 10;
            }
            return a;
        }
}