// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_14 {
    function getBalance(address _addr) 
        public 
        view 
        returns(uint) {
            return _addr.balance;
        }
    
    function etherUnits()
        public 
        pure 
        returns(uint, uint, uint){
            return(1 ether, 1 gwei, 1 wei); // 10^18, 10^9, 10^0
        }
    
    function ethDelivery1(address payable _addr) 
        public 
        payable {
            bool result = _addr.send(10 ether);
            require(result, "Failed");
        }
    
    function ethDelivery2(address _addr) 
        public 
        payable {
            payable(_addr).transfer(msg.value);
        }
}