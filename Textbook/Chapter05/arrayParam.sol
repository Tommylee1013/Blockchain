// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_11 {

    uint [] public numbers1 = [1,2,3];
    uint [] public numbers2 = [1,2,3];

    function _push99(uint [] storage input) 
        internal 
        returns(uint [] memory) {
            input.push(99);
            input.push(99);
            input.push(99);
            return (input);
        }
    
    function add() 
        public {
            _push99(numbers1);
            _push99(numbers2);
        }
    
    function add2() public returns(uint[] memory, uint[] memory) {
    uint[] memory updatedNumbers1 = new uint[](numbers1.length + 3);
    uint[] memory updatedNumbers2 = new uint[](numbers2.length + 3);

    for (uint i = 0; i < numbers1.length; i++) {
        updatedNumbers1[i] = numbers1[i];
    }
    for (uint i = 0; i < numbers2.length; i++) {
        updatedNumbers2[i] = numbers2[i];
    }

    updatedNumbers1[numbers1.length] = 99;
    updatedNumbers1[numbers1.length + 1] = 99;
    updatedNumbers1[numbers1.length + 2] = 99;

    updatedNumbers2[numbers2.length] = 99;
    updatedNumbers2[numbers2.length + 1] = 99;
    updatedNumbers2[numbers2.length + 2] = 99;

    numbers1 = updatedNumbers1;
    numbers2 = updatedNumbers2;

    return (updatedNumbers1, updatedNumbers2);
}
}