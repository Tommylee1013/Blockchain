// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Math {
    function add(uint num1, uint num2)
        public 
        pure 
        returns (uint) {
            return num1 + num2;
        }
}

contract quiz2 {
    Math public math;

    constructor() {
        math = new Math();
    }

    function addNumvers(uint n1, uint n2) 
        public 
        view 
        returns(uint) {
            return math.add(n1, n2);
        }
}

contract quiz2_1 {
    Math internal instance = new Math(); // internal할 경우 getter함수 호출되지 않음

    function addNumbers(uint n1, uint n2)
        public 
        view 
        returns(uint) {
            return instance.add(n1, n2);
        }
}