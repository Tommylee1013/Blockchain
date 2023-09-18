// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex2_6 {
    uint a = 5;
    function justA() public view returns(uint){
        return a;
    }
    function prePlus() public returns(uint){
        return ++a; // a += 1
    }
}