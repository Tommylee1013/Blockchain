// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_6 {

    string [] public fruitArray = ["apple", "banana", "coconut", "durian", "etrog"];

    function linearSearch(string memory word) 
        public 
        view 
        returns (uint256, string memory){
            for (uint idx = 0; idx < fruitArray.length; ++idx) {
                if (keccak256(bytes(fruitArray[idx])) == keccak256(bytes(word))) {
                    return (idx, fruitArray[idx]);
                }
            }
            return (0, "Nothing");
        }
}