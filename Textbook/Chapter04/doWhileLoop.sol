// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_8 {

    function fun1()
        public
        pure 
        returns(uint){
            uint result = 0;
            uint a = 0;
            do { // do문은 무조건 한 번은 실행한다
                result += a;
                ++a;
            } while(a < 3);
            return result;
        }
}