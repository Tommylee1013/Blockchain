// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_13{
    function fun1() 
        public 
        pure 
        returns(uint){
            uint result = 0;
            for(uint i = 0; i < 10; ++i){
                if(i == 0){break;}
                result += i;
            } return result;
        }
}