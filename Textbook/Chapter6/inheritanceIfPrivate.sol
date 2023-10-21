// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    string private schoolName = "Sogang University"; // 상속 불가능 
    string internal schoolNumbers = "02-1234-5678"; // 상속시 getter함수는 상속되지 않음
}

contract EconomicStudent is Student {
    function getSchoolNumbers()
        public 
        view 
        returns(string memory) {
            return schoolNumbers;
        }
}