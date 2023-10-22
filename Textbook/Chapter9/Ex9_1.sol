// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex9_1 {
    function getBalance(address _address) 
        public 
        view 
        returns(uint) {
            return _address.balance; // 잔액을 보는 내장함수. address 자료형은 기본적으로 다 가지고 있다
        }
    
    function getMsgValue()
        public 
        payable 
        returns(uint) {
            return msg.value; // 보낸 금액을 볼 수 있다
        }
}