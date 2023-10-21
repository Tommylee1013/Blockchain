// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz2 {

    uint [] public numbers;

    function addNumbers(uint value) 
        public {
            numbers.push(value);
        }
    
    function getNumbers(uint idx) 
        public 
        view 
        returns(uint) {
            return numbers[idx];
        }
    
    function deleteNumbers()
        public {
            numbers.pop();
        }
}