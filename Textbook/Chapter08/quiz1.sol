// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz1 {
    modifier numMoreThan5(uint _num) {
        require(_num > 5, "_num must be more than 5");
        _;
    }

    function value(uint _num) 
        public 
        pure 
        numMoreThan5(_num)
        returns(uint) {
            return _num;
        }
}