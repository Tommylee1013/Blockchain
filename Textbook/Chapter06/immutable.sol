// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_3 {
    uint public immutable num; // 초기값을 정하지 않아도 오류가 나지 않는다

    constructor(uint n) {
        num = n;
    }
    
}