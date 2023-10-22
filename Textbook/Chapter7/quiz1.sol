// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz1 {
    function revertFunction(uint _num) 
        public 
        pure 
        returns(uint) {
            if (_num >= 6) {
                revert("_num must be less than 6");
            }
            return _num;
        }
}