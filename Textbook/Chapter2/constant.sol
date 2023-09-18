// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex2_13 {
    uint constant a = 13;
    string constant b = 'Hi';
    function plusA() public pure returns(uint) {
        return a + 10;
    }

    /*
    function changeB() public pure returns (string){
        b = "Hello"; // error
    }
    */
}