// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Math {
    function division(uint num1, uint num2)
        public 
        pure 
        returns(uint) {
            return num1 / num2;
        }
}

contract Ex6_6 {
    event Information (string error);

    Math math = new Math();

    function divisionWithTryCatch(uint num1, uint num2) 
        public 
        returns(uint) {
            try math.division(num1, num2) returns (uint result) {
                emit Information ("Success");
                return (result);
            } catch {
                emit Information ("Failure");
                return (0);
            }
        }
}