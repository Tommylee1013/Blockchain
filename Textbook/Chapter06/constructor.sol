// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex6_2 {
    uint public num = 5;

    constructor(uint n) {
        num = n; // 가장 먼저 실행되는 함수이다. 즉, 배포 전에 미리 실행해야 배포가 된다
    }
}