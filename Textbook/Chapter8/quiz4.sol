// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//pragma solidity ^0.7.6;

library Math{
    function sub(uint num1, uint num2) 
        internal
        pure 
        returns(uint) {
            require(num2 <= num1, "Underflow Error");
            return num1 - num2;
        }
}

contract quiz4 {
    using Math for uint;

    function substraction(uint num1, uint num2)
        public 
        pure
        returns(uint) {
            return num1.sub(num2);
        }
}