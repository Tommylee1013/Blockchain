// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Math {
    uint result = 0;
    function add(uint256 num1, uint256 num2)
        public {
            result = num1 + num2;
        }
    
    function returnsResult()
        public 
        view 
        returns(uint) {
            return result;
        }
}

contract Buttons {
    function addButton(address addr, uint num1, uint num2)
        public {
            (bool success, ) = addr.call(
                abi.encodeWithSignature("add(uint256, uint256)", num1, num2)
                );
            require(success, "Failed");
        }

    function showResult(address addr)
        public 
        returns(bytes memory) {
            (bool success, bytes memory result) = addr.call(
                abi.encodeWithSignature("returnResult()")
                );
            require(success, "Failed");
            return result;
        }
}