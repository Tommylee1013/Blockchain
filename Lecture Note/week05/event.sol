// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_10 {

    event MyFunction(uint result, string name);
    
    function add(uint _a, uint _b)
        public { // pure 혹은 view가 불가능하다 
            uint total = _a + _b;
            emit MyFunction(total, "add");
        }

    function muliplier(uint _a, uint _b)
        public {
            uint total = _a * _b;
            emit MyFunction(total, "muliplier");
        }
}