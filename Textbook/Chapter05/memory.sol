// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_9 {

    uint public a = 3;
    uint public b = a;

    function changeA() 
        public 
        returns(uint, uint) {
            a = 5;
            return (a,b);
        }
    
    function changeInput(uint [] memory input) 
        public 
        pure 
        returns(uint [] memory, uint [] memory) {
            uint [] memory copyInput = input;
            copyInput[0] = 11;
            return (input, copyInput);
        }
}