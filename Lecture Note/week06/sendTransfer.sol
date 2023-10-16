// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_14 {

    function getBalance(address a) 
        public 
        view 
        returns(uint) {
            return a.balance;
        }
    
    function etherUnits()
        public 
        pure 
        returns(uint, uint, uint) {
            return (1 ether, 1 gwei, 1 wei);
        }
    
    function ethDelivery1(address payable a) 
        public 
        payable {
            bool result = a.send(10 ether);
            require(result, "Failed");
        }
    
    function ethDelivery2(address a) 
        public 
        payable {
            payable(a).transfer(msg.value);
        }
}