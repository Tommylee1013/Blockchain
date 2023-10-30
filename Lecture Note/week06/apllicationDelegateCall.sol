// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Points {
    uint public total;

    function addPoints(uint p) 
        public {
            total += p;
        }
}

contract Points2 {
    uint public total;
    function addPoints(uint p) 
        public {
            total += p * 2;
        }
}


contract UserInfo {
    uint public total;
    
    function pointUpWithDelegateCall(address _addr, uint p) 
        public {
            (bool success, ) = _addr.delegatecall(
                abi.encodeWithSignature("addPoints(uint256)", p)
            );
            require(success, "Failed");
        }
}
