// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EconomicStudent {
    uint private schoolHours;
    constructor(uint value) {
        schoolHours = value;
    }

    function time()
        public 
        virtual
        returns(uint) {
            return schoolHours;
        }
}

contract PartTimer {
    uint private workingHours;
    constructor(uint value) {
        workingHours = value;
    }

    function time() 
        public 
        virtual returns(uint) {
            return workingHours;
        }
}

contract Tommy is EconomicStudent(5), PartTimer(6) {
    function time()
        public 
        override(EconomicStudent, PartTimer)
        returns(uint) {
            return super.time(); // 함수 이름이 중복될 때 발생하는 오류를 회피할 수 있다
            // but, 나중에 선언된 contract의 time()을 상속받아 반환한다
        }
}
