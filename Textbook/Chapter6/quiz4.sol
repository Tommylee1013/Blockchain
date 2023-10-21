// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Math {
    function add(uint num1, uint num2) 
        external 
        pure 
        returns(uint);
    
    function mul(uint num1, uint num2) 
        external 
        pure 
        returns(uint);
}

contract quiz4 is Math {
    function add(uint num1, uint num2)
        public 
        pure 
        override 
        returns(uint) {
            return num1 + num2;
        }
    
    function mul(uint num1, uint num2) 
        public 
        pure 
        override 
        returns(uint) {
            return num1 * num2;
        }
}