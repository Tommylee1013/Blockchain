// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_6 {

    function fun1() 
        public 
        pure 
        returns(uint) {
            uint result = 0;
            for(uint i = 0; i<3; ++i){
                result += i;
            } return result;
        }
}