// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Receiver {
    event From(string info, address from);

    fallback() external {
        emit From("fallback()", msg.sender);
    }

    function outPut() 
        public 
        payable {
            emit From("outPut()", msg.sender);
        }
    
    function getBalance()
        public 
        view 
        returns(uint) {
            return address(this).balance;
        }
}

contract Caller {
    function expectFallback(address _addr) 
        public {
            (bool success, ) = _addr.call(
                abi.encodeWithSignature("outPut2()")
            );
            require(success, "Failed");
        }
    
    function outPutWithEther(address _addr)
        public 
        payable {
            (bool success, ) = _addr.call{value : msg.value}(
                abi.encodeWithSignature("outPut()")
            );
            require(success, "Failed");
        }
}