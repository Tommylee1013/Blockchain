// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract DataStructure {
    int a;
    unit b;
    bool c;
    bytes d;
    string e;
    address f;
    function assignment() public view returns(int, unit, bool, bytes memory, string memory, address){
        return(a, b, c, d, e, f);
    }
}
