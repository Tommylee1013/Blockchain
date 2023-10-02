// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_30 {
    function fun1()
        public 
        pure 
        returns(uint) {
            uint result = 0;
            uint a = 0;
            do{
                result += a;
                ++ a;
            } while(a < 3);
            return result;
        }
}

contract Ex4_31 {
    function fun2()
        public 
        pure 
        returns(uint) {
            uint result1 = 0;
            uint b = 0;
            do{
                result1 += b;
                ++ b;
            } while(b > 10);
            return result1;
        }
}