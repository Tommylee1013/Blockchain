// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz2 {
    modifier numMoreThan9(uint _num) {
        require(_num >= 10, "_num must be equivalent to or more than 10");
        _;
    }

    function minus10(uint _num)
        public 
        pure 
        numMoreThan9(_num)
        returns(uint) {
            return _num - 10;
        }
    
    function plus10(uint _num) 
        public 
        pure 
        numMoreThan9(_num)
        returns(uint) {
            return _num + 10;
        }
}