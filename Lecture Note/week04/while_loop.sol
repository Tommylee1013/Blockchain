// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_29 {
    function fun1() 
        public 
        pure 
        returns(uint) {
            uint result = 0;
            uint a = 3;
            while (a > 0) {
                result += a;
                --a;
            }
            return result;
        }
}