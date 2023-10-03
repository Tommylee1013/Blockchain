// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_6 {
    uint [] public array = [97, 98, 99];
    function getLength()
        public 
        view 
        returns(uint) {
            return array.length;
        }
    function popArray()
        public {
            array.pop();
        }
    function deleteArray(uint _index)
        public {
            delete array[_index];
        }
}