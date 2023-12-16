// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Count {
    uint count = 0;

    function getCount() 
        public 
        view 
        returns(uint) {
            return count;
        }
    
    function increase()
        public {
            count ++;
        }
    
    function decrease()
        public {
            count --;
        }
}