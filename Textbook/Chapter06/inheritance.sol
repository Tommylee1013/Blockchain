// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    string public schoolName = "Sogang University";
}

contract ArtStudent is Student {
    function getSchoolName() 
        public 
        view 
        returns(string memory) {
            return schoolName;
        }
    function changeSchoolName() 
        public {
            schoolName = "The University of BlockChain";
        }
}