// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_20 {
    uint public a = 3; // state variable

    function myFun1()
        external 
        view 
        returns(uint, uint) {
            uint b = 4; // local variable
            return (a, b);
        }

    /*
    function myFun2()
        external
        pure                    // error
        returns(uint) {
            return b;
        }
    */
}