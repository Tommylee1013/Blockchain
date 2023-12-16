// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz4 {

    function returnTwoValues(string memory str, uint num)
        public 
        pure 
        returns(string memory, uint) {
            return (str, num);
        }
}