// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_33 {
    function fun1()
        public 
        pure
        returns(uint){
            uint result = 0;
            for (uint i = 1; i < 2; ++i) {
                for (uint j = 2; j < 4; ++j) {
                    result += (i * j);
                }
            }
            return result;
        }
}