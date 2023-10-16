// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    string public schoolName = "The University of Solidity";
    string public major;
    constructor (string memory _major) {
        major = _major;
    }
}

contract ArtStudent is Student("Art"){

}

contract MusicStudent is Student {
    constructor() Student("Music") {}
}

contract MathStudent is Student {
    constructor(string memory _major) Student(_major) {}
}

// 생성자의 방법이 각각 다르다