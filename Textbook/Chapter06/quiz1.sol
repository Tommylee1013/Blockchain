// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz1 {
    event Info(uint);
    uint public num;

    constructor (uint value) {
        num = value;
    }

    function changeNum(uint value)
        public {
            num = value;
            emit Info(num);
        }

}