// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex9_1 {
    function getBalance(address _address) 
        public 
        view 
        returns(uint) {
            return _address.balance;
        }
    
    function getMsgValue()
        public 
        payable 
        returns(uint) {
            return msg.value;
        }
}