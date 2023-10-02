// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_24 {
    function fun1(uint a)
        public 
        pure 
        returns(uint) {
            if (a >= 10){
                a = 9; // 최대값은 9이다
            }
            return a;
        }
}