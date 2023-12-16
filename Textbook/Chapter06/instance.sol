// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Monitor {
    string public name;

    constructor (string memory n) {
        name = n;
    }

    function show()
        public 
        pure 
        returns(string memory) {
            return "show";
        }
}

contract SystemUnit {
    string public name = "Apple MacOS";

    function turnOn() 
        public 
        pure
        returns(string memory) {
            return "turn On";
        }
}

contract Computer {
    Monitor public monitor;
    SystemUnit public systemUnit;

    constructor() {
        monitor = new Monitor("Pro Display XDR");
        systemUnit = new SystemUnit();
    }

    function getAllNames() 
        public 
        view 
        returns(string memory, string memory) {
            return(monitor.name(), systemUnit.name()); // public 선언시 자동으로 getter함수 부여됨. name() method 사용가능
        }
    
    function start() 
        public 
        view 
        returns(string memory, string memory) {
            return(monitor.show(), systemUnit.turnOn());
        }
}