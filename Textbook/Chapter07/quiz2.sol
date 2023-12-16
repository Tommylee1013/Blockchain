// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz2 {
    function revertFunction(uint _num) 
        public 
        pure 
        returns(uint) {
            require(_num < 6, "_num must not be more than 5");
            return _num;
        }
}