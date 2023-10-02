// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_28 {
    function fun1()
        public 
        pure 
        returns(uint) {
            uint result = 0;
            for (uint a = 0; a < 3; ++a) {
                result += a;
            }
            return result;
        }
}