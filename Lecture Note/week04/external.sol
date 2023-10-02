// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_23 {
    function funExt()
        external 
        pure 
        returns(uint) {
            return 2;
        }
    function outputExt()
        public
        view
        returns(uint) {
            return this.funExt();
        } // this keyword 통해서 external 함수 호출이 가능하다
}