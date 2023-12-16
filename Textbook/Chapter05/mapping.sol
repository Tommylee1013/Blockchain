// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_1 {

    mapping(address => uint) public balances;

    function addMapping(address _key, uint _amount) // 직접 추가한다
        public {
            balances[_key] = _amount;
        }
    
    function getMapping(address _key) // key값을 참조해 return한다
        public 
        view 
        returns(uint) {
            return balances[_key];
        }
}