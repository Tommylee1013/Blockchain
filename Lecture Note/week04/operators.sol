// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_7 {
    uint a = 5 + 2; // 덧셈
    uint b = 5 - 2; // 뺄셈
    uint c = 5 * 2; // 곱셈
    uint d = 5 / 5; // 나눗셈
    uint e = 5 % 2; // 나머지
    uint f = 5 ** 2; // 자승

    function arithmetic() public view returns(uint, uint, uint, uint, uint, uint) {
        return(a,b,c,d,e,f);
    }
}