// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_4 {

    function fun1(uint a) 
        public 
        pure 
        returns(uint) {
            if (a >= 1) {a = 1;}
            else if (a >= 2) {a = 2;}
            else if (a >= 3) {a = 3;}
            else {a = 4;}
            return a;
        }

    function fun2(uint a)
        public 
        pure 
        returns(uint) {
            if (a >= 1) {a = 1;}
            if (a >= 2) {a = 2;}
            if (a >= 3) {a = 3;}
            else {a = 4;}
            return a;
        }

    // 두 함수의 결과가 확연히 다른 것을 알 수 있다.
    // 따라서, if와 else if문은 조심해서 사용하도록 한다.
}