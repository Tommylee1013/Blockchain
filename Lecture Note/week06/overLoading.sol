// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {

    function major()
        public 
        pure 
        virtual 
        returns(string memory) {
            return "Math";
        }
}

contract ArtStudent is Student {

    function major1() 
        public 
        pure 
        returns (string memory) {
            return "Art";
        }
    
    function major1(string memory value) 
        public 
        pure 
        returns (string memory){
            return value; // Overloading, 같은 method를 써도 parameter가 다르면 상관없다
        }
}