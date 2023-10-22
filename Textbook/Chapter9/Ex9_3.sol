// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex9_3 {

    function getBalance(address _addr) 
        public 
        view 
        returns(uint) {
            return _addr.balance;
        }
    
    function etherUnits()
        public 
        pure 
        returns(uint, uint, uint) {
            return(1 ether, 1 gwei, 1 wei);
        }
    
    function ethDelivery1(address payable _addr)
        public 
        payable {
            bool result = _addr.send(10 ether); // 10 ether를 보내는 것을 bool로 저장하고
            require(result, "Failed"); // 충족하지 못한 경우 예외처리
        }
    
    function ethDelivery2(address payable _addr) 
        public 
        payable {
            payable(_addr).transfer(msg.value); // value만큼을 transfer한다
        }
}