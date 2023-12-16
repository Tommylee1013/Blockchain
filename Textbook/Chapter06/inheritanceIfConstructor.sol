// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    string public schoolName = "Sogang University";
    string public major;
    constructor(string memory value) {
        major = value;
    }
}

contract EconomicStudent is Student("Economic") {}

contract DataScienceStudent is Student {
    string internal degree = "Data Science";
    constructor() Student(degree) {}
}

contract JapaneseStudent is Student{
    constructor(string memory value) Student(value) {}
}