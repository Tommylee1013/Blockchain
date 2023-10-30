// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint private count;

    function get()
        public 
        view 
        returns(uint) {
            return count;
        }
    
    function inc()
        public {
            count += 1;
        }
    
    function dec()
        public {
            count -= 1; // require을 사용해서 예외 처리를 하면 더 좋을것 같다
        }
}