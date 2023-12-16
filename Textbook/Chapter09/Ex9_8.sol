// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex9_8 {

    constructor() payable {

    }

    function getBalance()
        public 
        view 
        returns(uint) {
            return address(this).balance;
        }
}