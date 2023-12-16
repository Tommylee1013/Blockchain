// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex5_7 {

    struct Human {
        string name;
        uint age;
        string job;
    }

    Human public human1 = Human("poly", 25, "artist");
    Human public human2;

    function getHuman1()
        public 
        view 
        returns(Human memory) {
            return human1;
        }
    
    function getHuman2()
        public 
        view 
        returns(Human memory) {
            return human2;
        }
    
    function initializeHuman2(string memory name, uint age, string memory job)
        public {
            human2 = Human(name, age, job);
        }
    
    function changeJobHuman1(string memory job)
        public {
            human1.job = job;
        }
    
    function getNameHuman1()
        public 
        view 
        returns(string memory) {
            return human1.name;
        }
}