// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_3 {
    function runRevert(uint _num)
        public 
        pure 
        returns(uint) {
            if(_num <= 3) {
                revert("Revert error : should input more than 3");
            }
            return _num;
        }
    
    function runRequire(uint _num) 
        public 
        pure 
        returns(uint) {
            require(_num > 3, "Require error : should input more than 3");
            return _num;
        }
}