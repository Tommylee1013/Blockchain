// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz3 {

    uint public num = 10;

    function doubledNum() 
        public 
        view 
        returns(uint) {
            uint result = num * 2;
            return result;
        }

}