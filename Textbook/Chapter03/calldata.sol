// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex3_16 {
    function myFun(
        string calldata str
    )
        external 
        pure 
        returns(string memory) {
            return str;
        }
}