// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Math {
    function add(uint8 a, uint8 b)
        internal 
        pure 
        returns(uint8) {
            require(a + b > a, "Error : addition Overflow");
            return a + b;
        }
}

contract Ex8_6 {
    using Math for uint8;

    function overflow(uint8 int1, uint8 int2)
        public 
        pure 
        returns(uint8) {
            return int1 + int2;
        }
    
    function noOverflow1(uint8 int1, uint8 int2)
        public 
        pure 
        returns(uint8) {
            return Math.add(int1, int2);
        }
    
    function noOverflow2(uint8 int1, uint8 int2)
        public 
        pure 
        returns(uint8) {
            return int1.add(int2);
        }
}