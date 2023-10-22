// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Ex8_4_1.sol";
import "./Ex8_4_2.sol";

contract Tommy is EconomicStudent, PartTimer {
    uint public totalHours = schoolHours + workingHours;
}