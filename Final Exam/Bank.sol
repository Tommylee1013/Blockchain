// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    address public owner;
    mapping(address => uint256) public account;

    event Deposit(
        address indexed _address, 
        uint _value
    );
    event Withdrawal(
        address indexed _address, 
        uint _value
    );

    constructor() {
        owner = msg.sender;
    }

    receive() external payable { }

    modifier onlyOwner() {
        require(owner == msg.sender, "Error : Only owner can call this function");
        _;
    }

    function deposit()
        public 
        payable {
            require(msg.value > 0, "Error : deposit must be bigger than 0");
            account[msg.sender] += msg.value;
            emit Deposit(msg.sender, msg.value);
        }
    
    function withdraw(uint256 amount)
        public {
            require(amount > 0, "Error : withdrawal must be bigger than 0");
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
        returns(uint256) {
            return address(this).balance;
        }
}