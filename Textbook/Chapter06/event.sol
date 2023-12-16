// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_1 {
    event MyFunction(uint result, string name); // 선언, event사용시 가스비를 조금이라도 더 줄일 수 있다

    function add(uint a, uint b)
        public { // block chain에 직접 저장하기 때문에 pure, view 사용불가능
            uint total = a + b;
            emit MyFunction(total, "add"); // event 출력은 emit이다
        }
    
    function mul(uint a, uint b) 
        public {
            uint total = a * b;
            emit MyFunction(total, "mul");
        }
}