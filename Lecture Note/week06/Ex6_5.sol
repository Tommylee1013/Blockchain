// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Adult {
    uint public age;
    constructor (uint _age) {
        require(_age > 19, "Shold be more than 19 years old");
        age = _age;
    }
}

contract Ex6_5 {
    event Information (string error);

    function instantiate(uint age) 
        public 
        returns(uint) {
            try new Adult(age) returns(Adult adult) {
                emit Information ("Success");
                return (adult.age());
            } catch {
                emit Information ("Failed : the default age is 20");
                Adult adult = new Adult(20);
                return (adult.age());
            }
        }  // error message는 뜨지만 실행은 된다. 따라서 결과는 20이 된다
}