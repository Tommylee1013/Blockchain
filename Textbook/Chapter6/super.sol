// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Student {
    string [] internal courses;

    function showCourses() 
        public 
        virtual 
        returns(string[] memory) {
            delete courses;
            courses.push("Introduction to Bigdata Programming");
            courses.push("Linear Algebra");
            return courses;
        }
}

contract EconomicStudent is Student {
    function showCourses()
        public 
        override 
        returns(string[] memory) {
            super.showCourses();
            courses.push("Economics I");
            courses.push("Economics II");
            return courses;
        }
}