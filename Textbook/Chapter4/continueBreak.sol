// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_12{
    function fun1()
        public 
        pure 
        returns(uint){
            uint result = 0;
            for (uint i = 0; i < 2; ++i){
                if(i == 1){continue;}
                result += i;
            } return result;
        }
}