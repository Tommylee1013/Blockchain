// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_7 {

    modifier numMoreThan1(uint num) {
        require(num > 1, "num must ne more than 1");
        _;
    }

    function getValue1(uint num) 
        public 
        pure 
        numMoreThan1(num)
        returns(uint){
            return num;
        }

    function getValue2(uint num) 
        public 
        pure 
        numMoreThan1(num)
        returns(uint){
            return num * 2;
        }
}