// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EconomicStudent {
    string public schoolName = "Sogang University";
    uint public schoolHours = 5;
}

contract PartTimer {
    string public workPlace = "A pizza restaurant";
    uint public workingHours = 5;
}

contract Tommy is EconomicStudent, PartTimer {
    uint public totalHours = schoolHours + workingHours; 
    // multi inheritance의 경우, 상속받는 contract끼리 변수와 함수 이름이 중복되면 안된다
}