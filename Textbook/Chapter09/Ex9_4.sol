// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex9_4 {
    function getBalance(address _addr)
        public 
        view 
        returns(uint) {
            return _addr.balance;
        }
    
    function ethDelivery(address _addr)   
        public 
        payable {
            (bool result, ) = _addr.call{value : msg.value, gas : 30000}("");
            require(result, "Failed");
        }
}