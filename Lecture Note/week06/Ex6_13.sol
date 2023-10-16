// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_13 {

    address public owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Error : caller is not the owner");
        _;
    }

    constructor() {
        owner = msg.sender; // 배포자 주소를 저장한다
    }

    function getBalance(address a) 
        public 
        view 
        onlyOwner()
        returns(uint) {
            return a.balance;
        }
    
    function getMsgValue()
        public 
        payable 
        onlyOwner
        returns(uint) {
            return msg.value;
        }
}