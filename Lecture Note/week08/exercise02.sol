// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    address public owner; // 배포자를 저장해 주어야 한다. 기본값은 iternal이므로, public으로 해 준다
    mapping(address => uint256) public account;

    event Deposit(address indexed _address, uint256 _value); // 누가 얼마를 입금했는지 block chain에 기록해 두겠다는 뜻이다
    event Withdrawal(address indexed _address, uint256 _value);
    // indexed는 검색을 위한 것으로, event를 찾기 위한 것이다

    constructor () {
        owner = msg.sender; // smart contract의 배포자가 처음에 지정된다
    }

    modifier onlyOwner() { // 재활용성, 유지보수성을 높이기 위해 modifier를 사용한다
        require(owner == msg.sender, "Error : caller is not the owner"); //sender와 owner가 다르면 Error출력
        _; // function logic
    }

    function deposit() // deposit 버튼을 누르면 contract balance의 금액이 증가한다
        public 
        payable {
        require(msg.value > 0, "Error: Value must be greater than 0"); // 0보다 작으면 거래를 reject
        account[msg.sender] += msg.value; // value를 저장
        emit Deposit(msg.sender, msg.value); // 예금을 했다는 정보를 블록체인에 저장한다
    }

    function withdraw(uint amount) 
        public {
        require(account[msg.sender] >= amount, "Error: Insufficient balance"); // 잔고가 보내려는 금액보다 부족하면 에러 출력
        account[msg.sender] -= amount; // 계정주소의 값을 뺀다
        payable(msg.sender).transfer(amount); // amount만큼 송금한다
        emit Withdrawal(msg.sender, amount);
    }
    
    function getBalance()
        public 
        view 
        returns(uint) {
            return account[msg.sender];
        }
    
    function getContractBalance()
        public 
        view 
        onlyOwner()
        returns(uint) {
            return address(this).balance;
        }
}