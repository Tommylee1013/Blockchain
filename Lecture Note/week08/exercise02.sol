// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    address public owner; // 배포자를 저장해 주어야 한다. 기본값은 iternal이므로, public으로 해 준다
    mapping(address => uint) public account;

    event Deposit(address _address, uint _value);
    event Withdrawal(address _address, uint _value);

    modifier onlyOwner() {
        require(owner == msg.sender, "Error : caller is not the owner"); //sender와 owner가 다르면 Error출력
        _; // function logic
    }

    constructor () {
        owner = msg.sender; // smart contract의 배포자가 처음에 지정된다
    }

    function deposit() public payable {
        require(msg.value > 0, "Error: Value must be greater than 0");
        account[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) public {
        require(account[msg.sender] >= amount, "Error: Insufficient balance");
        account[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
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