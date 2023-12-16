// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz4 {
    function output5() 
        public 
        pure 
        returns(uint) {
            return 5;
        }
    
    function output5WithTryCatch() 
        public 
        view
        returns(uint) {
            try this.output5() returns (uint) {
                revert("Always failure");
            } catch {
                return (0);
            }
        }
}