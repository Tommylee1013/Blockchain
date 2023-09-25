// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_19 {
    function myFun(string calldata str)
        external
        pure 
        returns(string memory) {
            return str;
        }
}