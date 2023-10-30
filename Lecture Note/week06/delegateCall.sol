// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Points {
    uint public total;
    event From(address from);

    function addPoints(uint p) 
        public {
            total += p;
            emit From(msg.sender);
        }
}

contract UserInfo {
    uint public total;
    function pointUpWithCall(address _addr, uint p)
        public {
            (bool success, ) = _addr.call(
                abi.encodeWithSignature("addPoints(uint256)", p)
            );
            require(success, "Failed");
        }
    
    function pointUpWithDelegateCall(address _addr, uint p) 
        public {
            (bool success, ) = _addr.delegatecall(
                abi.encodeWithSignature("addPoints(uint256)", p)
            );
            require(success, "Failed");
        }
}
