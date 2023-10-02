// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_21 {
    uint public pub = 1;
    uint private pri = 2;
    uint internal inter = 3;
    // uint external ext = 4; // external은 변수로 적용이 불가능하다

    function funPub() 
        public
        view 
        returns(uint, uint, uint) {
            return (pub, pri, inter);
        }
    function funPriv()
        private
        view 
        returns(uint, uint, uint) {
            return (pub, pri, inter);
        }
    function funInter()
        internal 
        view 
        returns(uint, uint, uint) {
            return(pub, pri, inter);
        }
    function funExt()
        external 
        view 
        returns(uint, uint, uint){
            return(pub, pri, inter);
        }
}