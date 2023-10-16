// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Math {
    function add(uint8 a, uint8 b) 
        internal 
        pure 
        returns (uint8) {
            require(a + b >= a, "Error : addition overflow");
            return a + b;
        }
}

contract Ex6_11 {
    using Math for uint8;

    function overflow(uint8 num1, uint8 num2) 
        public 
        pure 
        returns(uint8) {
            return num1 + num2;
        }
    
    function noOverflow1(uint8 num1, uint8 num2) 
        public 
        pure 
        returns(uint8) {
            return Math.add(num1, num2);
        }
    
    function noOverflow2(uint8 num1, uint8 num2)
        public 
        pure 
        returns(uint8) {
            return num1.add(num2);
        }
}