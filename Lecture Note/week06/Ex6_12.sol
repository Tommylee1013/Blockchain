// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_12{

    function getBalance(address _address) 
        public 
        view 
        returns(uint) {
            return _address.balance;
        }
    
    function getMsgValue() // ether를 보내면서 받는 것. payable을 꼭 써 주어야 한다. payable은 빨갛게 표시된다
        public 
        payable 
        returns(uint) {
            return msg.value; // 보낸 금액을 출력
        }
    
    function getMsgSender()
        public 
        view 
        returns(address) {
            return msg.sender; // 보낸 사람 정보를 출력
        }
}