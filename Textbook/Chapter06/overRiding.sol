// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    function major()
        public 
        pure 
        virtual 
        returns(string memory) {
            return "Data Science";
        }
}

contract EconomicStudent is Student {
    function major()
        public 
        pure 
        override 
        returns(string memory) {
            return "Economics";
        }
}