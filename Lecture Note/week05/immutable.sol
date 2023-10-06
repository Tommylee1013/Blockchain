// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_12 {

    //uint public constant num1;
    //uint [] public immutable arr;
    uint public immutable num2;

    constructor(uint _num) {
        num2 = _num;
    }

    /*
    function change() 
        public
        pure
        returns(uint) {
            num2 = 10; // immutable 데이터는 변경 불가능
        }
    */
}