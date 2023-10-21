// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz1 {

    mapping (address => string) public name;

    function addName(address key, string memory _name)
        public {
            name[key] = _name;
        } 
    
    function getName(address key)
        public 
        view 
        returns(string memory) {
            return name[key];
        }
    
    function deleteName(address key) 
        public {
            delete name[key];
        }

}