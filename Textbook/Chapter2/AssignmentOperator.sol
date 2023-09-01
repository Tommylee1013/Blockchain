// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract AssignmentOperator {
    string a = 'Hello';

    function assignment() public returns(string memory){

        a = 'Hello Solidity';
        return(a);

    }
}
