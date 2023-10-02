// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_22 {
    function funExt()
        external 
        pure 
        returns(uint) {
            return 2;
        }
    function funPri()
        private
        pure 
        returns(uint) {
            return 3;
        }
    /*
    function outPutExt1() 
        public 
        pure 
        returns(uint) {
            return funExt();
        }
    */  // external 선언된 함수는 this keyword를 통해 접근이 가능하다
    function outPutPri()
        public 
        pure 
        returns(uint) {
            return funPri();
        }
}