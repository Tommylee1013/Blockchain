// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex9_2 {
    address public owner;
    modifier onlyOwner() {
        require(owner == msg.sender, "Error: caller is not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function getBalance(address _addr) 
        public 
        view 
        onlyOwner()
        returns(uint) {
            return _addr.balance;
        }
    
    function getMsgValue()
        public 
        payable 
        onlyOwner()
        returns(uint) {
            return msg.value;
        }
}