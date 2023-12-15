// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz1 {
    function sendEther(address _address) 
        public 
        payable {
            (bool success,) = _address.call{value : msg.value}("");
            require(success, "Error : Transaction is Failed");
        }
}