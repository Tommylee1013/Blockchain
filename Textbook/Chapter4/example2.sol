// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz2{
    function fun1()
        public 
        pure 
        returns(uint){
            uint result = 0;
            for (uint i = 1; i < 11; ++i){
                result += i;
            } return result;
        }
}