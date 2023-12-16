// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz2 {

    receive() external payable {

    }

    function getBalance() 
        public 
        view 
        returns(uint) {
            return address(this).balance;
        }

    function sendEther()
        public 
        payable {
            payable(address(this)).transfer(msg.value); // 현재 contract에 이더 전송
        }
}