// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_8 {

    struct Human {
        string name;
        uint age;
    }

    Human [] public humanArray;
    mapping(address => Human) public humanMapping;

    function addArray(string memory name, uint age) 
        public {
            humanArray.push(Human(name, age));
        }
    
    function getArrayName(uint idx)
        public 
        view 
        returns(string memory) {
            return humanArray[idx].name;
        }
    
    function addMapping(address key, string memory name, uint age) 
        public {
            humanMapping[key] = Human(name, age);
        }
    
    function getMappingAge(address key) 
        public 
        view 
        returns(uint) {
            return humanMapping[key].age;
        }
}