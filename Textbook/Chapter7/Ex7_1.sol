// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex7_1 {
    function runAssert(bool value) 
        public 
        pure 
        returns(bool) {
            assert(value);
            return value;
        }
    
    function divisionByZero(uint num1, uint num2)   
        public 
        pure 
        returns(uint) {
            return num1 / num2;
        }
}