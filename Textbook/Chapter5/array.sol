// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_3 {

    uint [] public array1; // dynamic array
    string [5] public array2 = ["apple", "banana", "coconut"]; // static array

    function getLength1() 
        public 
        view
        returns(uint) {
            return array1.length;
        }

    function getLength2()
        public 
        view 
        returns(uint) {
            return array2.length;
        }
    
    function getArray1(uint _idx)
        public 
        view 
        returns(uint) {
            return array1[_idx];
        }

    function getArray2(uint _idx) 
        public 
        view 
        returns(string memory) {
            return array2[_idx];
        }
}