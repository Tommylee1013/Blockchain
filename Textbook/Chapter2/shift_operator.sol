// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex2_10 {
    bytes1 a = 0x10;
    function left() public view returns (bytes1) {
        return a << 1;
    }
    function right() public view returns (bytes1) {
        return a >> 1;
    }
}