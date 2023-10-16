// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    string private schoolName = "Solidity";
    string internal schoolNumbers = "02-1234-5678";
}

contract ArtStudent is Student {
    /*
    function getSchoolName() 
        public
        view
        returns(string memory) {
            return schoolName;
    */ // private은 상속받아서 사용할 수 없다.

    function getSchoolNumbers()
        public 
        view 
        returns(string memory) {
            return schoolNumbers;
        }
}