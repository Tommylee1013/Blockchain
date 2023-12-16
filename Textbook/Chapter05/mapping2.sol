// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_2 {

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

    function deleteMapping1(address _key) 
        public {
            delete(balances[_key]); // 데이터를 아예 삭제하는 것
        }

    function deleteMapping2(address _key)
        public {
            balances[_key] = 0; // 0으로 초기화하는 것
        }
}