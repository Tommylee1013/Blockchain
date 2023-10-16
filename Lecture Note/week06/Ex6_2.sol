// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_2 {

    function runAssert(bool _bool)
        public 
        pure 
        returns(bool) {
            assert(_bool);
            return _bool;
        }

    function divisionByZero(uint _num1, uint _num2)
        public 
        pure 
        returns(uint) {
            return _num1 / _num2;
        }
}