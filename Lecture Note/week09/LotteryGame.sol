// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract LotteryGame {
    address public manager;
    address[] public players;
    bool check = true;

    constructor () {
        manager = msg.sender;
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

    function enter()
        public 
        searchEnter() {
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
        view 
        returns(address) {
            return players[random() % players.length];
        }

}