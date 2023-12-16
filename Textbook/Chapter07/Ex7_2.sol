// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex7_2 {
    function runRevert(uint num) 
        public 
        pure 
        returns(uint) {
            if (num <= 3) {
                revert("Revert error : should input more than 3");
            }
            return num;
        }
    
    function runRequire(uint num) 
        public 
        pure 
        returns(uint) {
            if (num <= 3) {
                require(num > 3, "Require error : should input more than 3");
            }
            return num;
        }
}