// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Adult {
    uint public Age;
    constructor(uint age) {
        require(age > 19, "Should be more than 19 years old");
        Age = age;
    }
}

contract Ex7_4 {
    event Information(string error);
    function instantiate(uint age)  
        public 
        returns(uint) {
            try new Adult(age) returns(Adult adult) {
                emit Information("Success");
                return (adult.Age());
            } catch {
                emit Information("Failed : the default age is 20");
                Adult adult = new Adult(20);
                return (adult.Age());
            }
        }
}