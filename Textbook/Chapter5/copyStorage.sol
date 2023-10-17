// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_13 {

    uint [] public numbers = [1,2,3]; // 배열

    uint [] public copyNumbers = numbers; // numbers를 복사한 값

    function add() 
        public 
        returns(uint [] memory, uint [] memory) {
            copyNumbers.push(99);
            return (numbers, copyNumbers);
        }
}