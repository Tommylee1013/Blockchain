// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_15 {

    function getBalance(address _addr)
        public 
        view 
        returns(uint) {
            return _addr.balance;
        }
    
    function ethDelivery(address _addr) 
        public 
        payable {
            (bool result, ) = _addr.call{value : msg.value, gas : 30000}(""); // 함수를 호출하지 않고 이더만 보내겠다는 뜻
            require(result, "Failed");
        }
}