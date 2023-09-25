// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ex4_11 {
    bool a = 3 > 4;
    bool b = 3 < 4;
    bool c = 5 >= 2;
    bool d = 5<= 5;
    bool e = 3 == 2;
    bool f = 3 != 2;

    function comparison() public view returns(bool, bool, bool, bool, bool, bool){
        return(a,b,c,d,e,f);
    }
}