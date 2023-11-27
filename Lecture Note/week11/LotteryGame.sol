// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract LotteryGame {
    address public manager;
    address[] public players;

    enum Status {
        open,
        close
    }

    Status public lottoStatus;

    event PlayerEntered(address player);
    event Winner(address winner);

    bool check = true;

    modifier restricted() {
        require(msg.sender == manager, "Error : Only the manager can call this function");
        _;
    }

    modifier isManager() {
        require(msg.sender != manager, "Error : Manager can not bet the lottery game");
        _;
    }

    constructor() {
        manager = msg.sender;
    }

    function getPlayers() 
        public 
        view 
        returns (address[] memory) {
            return players;
    }

    function checkDup() 
        private 
        view 
        returns (bool) {
            for (uint i = 0; i < players.length; i++) {
                if (players[i] == msg.sender) {
                    return true;
                }
            }
            return false;
    }

    function enter() 
        public 
        payable 
        isManager() {
            require(lottoStatus == Status.open, "Error : Gane is not open");
            require(msg.value == 1 ether, "Only 1 Ether is Allowed");
            if (checkDup() == false) {
                players.push(msg.sender);
                emit PlayerEntered(msg.sender);
            }
        }

    function random() 
        private 
        view 
        returns (uint) {
            uint hash = uint(keccak256(abi.encodePacked(block.number, block.timestamp, players.length)));
            return hash;
    }

    function pickWinner() 
        public 
        restricted() {
            require(lottoStatus == Status.close, "Error : The Game is not ended");
            uint index = random() % players.length;
            address winner = players[index];
            delete players;
            payable(winner).transfer(address(this).balance); 
            emit Winner(winner);
    }

    function openGame()
        public 
        restricted() {
            lottoStatus = Status.open;
        }

    function closeGame()
        public 
        restricted() {
            lottoStatus = Status.close;
        }
}