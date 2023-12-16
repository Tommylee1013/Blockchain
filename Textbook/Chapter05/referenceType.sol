// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_10 {

    uint [] public numbers = [1,2,3];

    function _push99(uint [] storage input) 
        internal 
        returns(uint [] memory) {
            uint [] storage copyInput = input;

            copyInput.push(99);
            copyInput.push(99);
            copyInput.push(99);
            return (copyInput);
        }
    
    function add() 
        public 
        returns(uint [] memory, uint [] memory) {
            return (numbers, _push99(numbers));
        }

}