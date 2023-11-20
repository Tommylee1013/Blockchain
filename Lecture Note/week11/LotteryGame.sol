// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract LotteryGame {
    address public manager;
    address[] public players;
    bool check = true;

    constructor () {
        manager = payable(msg.sender);
    }

    modifier restricted() {
        require(manager == msg.sender, "Error : You are not Manager");
        _;
    }

    modifier searchEnter() {
        for (uint idx = 0; idx < players.length; ++idx) {
            if (players[idx] == msg.sender) {
                check = false;
            }
        }
        _;
    }

    function checkDup()
        private 
        view 
        returns(bool) {
            for (uint idx = 0; idx < players.length; idx++) {
            if (players[idx] == msg.sender) {
                return true;
            }
            return false;
            }
        }

    function enter()
        public 
        payable {
            require(msg.value == 1 ether, "Error : Only 1 Ether is allowed");
            bool dup = checkDup();
            require(dup == false);
            players.push(msg.sender);
        }
    
    function getPlayers()
        public 
        view 
        returns(address[] memory) {
            return players;
        }

    function random() 
        private 
        view 
        returns(uint) {
            bytes32 hash = keccak256(abi.encodePacked(block.number, block.timestamp, players.length));
            return uint(hash);
        }

    function pickWinner()
        public  
        payable
        restricted() {
            address winner = players[random() % players.length];
            delete players;
            payable(winner).transfer(address(this).balance);
        }

}