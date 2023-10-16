// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    string public schoolName = "The University of Solidity";
}

contract ArtStudent is Student {

    function changeSchoolName() 
        public {
            schoolName = "The University of BlockChain";
        }

    function getSchoolName() 
        public 
        view 
        returns(string memory) {
            return schoolName;
        }
}