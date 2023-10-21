// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    function university() 
        public 
        pure 
        virtual 
        returns(string memory) {
            return "The Univerity of Solidity";
        }
}

contract quiz3 is Student{
    function university()
        public 
        pure 
        override 
        returns(string memory) {
            return "The University of Blockchain";
        }
}