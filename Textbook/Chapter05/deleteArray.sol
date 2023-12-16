// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_5 {

    uint [] public array = [97, 98, 99];

    function getLength()
        public 
        view 
        returns(uint) {
            return array.length;
        }
    
    function popArray() 
        public {
            array.pop(); // pop method 실행
        }

    function deleteArray(uint _idx) 
        public {
            delete array[_idx];
        }
}