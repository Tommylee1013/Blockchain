// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_17 {

    constructor()
        payable {}

    function getBalance()
        public 
        view 
        returns(uint) {
            return address(this).balance;
        }
    
    // SmartContract 배포자가 돈을 넣는 것이다
}