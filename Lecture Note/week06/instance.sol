// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 상태변수가 블록체인에 영원히 저장된다
contract Monitor {
    string public name;
    constructor(string memory _name) {
        name = _name;
    }
    function show()
        public 
        pure 
        returns (string memory) {
            return "show";
        }
}

contract SystemUnit {
    string public name = "XG12";
    function turnOn() 
        public 
        pure 
        returns(string memory) {
            return "turnOn";
        }
} // contract 배포된다는 것은? 블록체인에 저장되어 주소를 가지게 된다는 것이다

contract Computer {
    Monitor public monitor;
    SystemUnit public systemUnit;

    constructor() {
        monitor = new Monitor("DW12");
        systemUnit = new SystemUnit();
    }

    function getAllNames()
        public 
        view 
        returns(string memory, string memory) {
            return (monitor.name(), systemUnit.name());
        }

    function start() 
        public 
        view 
        returns(string memory, string memory) {
            return (monitor.show(), systemUnit.turnOn());
        }
}