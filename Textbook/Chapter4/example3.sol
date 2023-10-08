// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz3{

    function fun1() 
        public 
        pure 
        returns(uint) {
            uint result = 0;
            uint i = 10;
            while (i > 0) {
                result += i;
                --i;
                if (i == 5){break;}
            } return result;
        }
}