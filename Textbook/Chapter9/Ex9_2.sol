// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex9_2 {
    address public owner;
    modifier onlyOwner() {
        require(owner == msg.sender, "Error: caller is not the owner");
        _;
    }

    constructor() { //constructor를 통해 owner를 미리 지정할 수 있다
        owner = msg.sender; // 보낸 사람 정보
    }

    function getBalance(address _addr) 
        public 
        view 
        onlyOwner()
        returns(uint) {
            return _addr.balance; // 주소의 잔액을 볼 수 있음
        }
    
    function getMsgValue()
        public 
        payable 
        onlyOwner()
        returns(uint) {
            return msg.value;
        }
}