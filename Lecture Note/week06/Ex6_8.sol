// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_8 {

    uint public a;
    uint public b;

    modifier plusA() {
        a += 1;
        _; // 함수의 logic
    }

    modifier plusB() {
        _; // 함수의 logic
        b += 1;
    }

    function mulA() 
        public 
        plusA() {
            a *= 2;
        }
    
    function mulB()
        public 
        plusB() {
            b *= 2;
        }
}