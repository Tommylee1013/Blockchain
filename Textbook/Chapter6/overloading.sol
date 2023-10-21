// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    function mul(uint num1, uint num2) 
        public 
        pure 
        returns(uint) {
            return num1 * num2;
        }
    
    function mul(uint num1, uint num2, uint num3)
        public 
        pure 
        returns(uint) {
            return num1 * num2 * num3;
        }
}

contract Ex6_9 {
    Calculator internal calculator = new Calculator(); // instnace

    function getNumbers()
        public 
        view 
        returns(uint, uint) {
            return(calculator.mul(4,5), calculator.mul(4,5,6));
        }
}