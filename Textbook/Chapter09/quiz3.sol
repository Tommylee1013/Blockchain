// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Math {
    function mul(uint _num1, uint _num2)
        public 
        pure 
        returns(uint) {
            return _num1 * _num2;
        }
}

contract quiz3 {
    function CallMath(
        address _address, 
        uint _num1, 
        uint _num2) 
        public 
        returns(bytes memory) {
            (bool success, bytes memory output) = _address.call(
                abi.encodeWithSignature("mul(uint256, uint256)", _num1, _num2) // 외부 컨트랙트의 주소 복사해서 함수를 참조한다. abi를 통해 값을 가져온다
            );
            require(success, "Failed");
            return output;
        }
}