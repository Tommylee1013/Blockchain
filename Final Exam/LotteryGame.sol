// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager;
    address[] public players;

    enum Status {
        open,
        close
    }

    Status public lottoStatus;

    modifier restricted() {
        require(msg.sender == manager, "Error : you are not game manager!");
        _;
    }

    constructor() {
        manager = msg.sender;
    }

    function getPlayers()
        public 
        view 
        returns(address[] memory) {
            return players;
        }

    function changePhase() 
        public 
        restricted() {
            lottoStatus = Status.close;
        }
    
    function enter()
        public 
        payable {
            require(lottoStatus == Status.open, "Error : The Game is not opened");
            require(msg.value == 1 ether, "Error : Only 1 ehter is allowed");
            bool check = true;
            for (uint i = 0; i < players.length; i++) {
                if (players[i] == msg.sender) {
                    check = false;
                }
            }
            require(check == true, "Error : you have alreay entered this game");

            players.push(msg.sender);
        }
    
    function random()
        private
        view 
        returns(uint) {
            return uint(
                keccak256(
                    abi.encodePacked(
                        block.number, 
                        block.timestamp, 
                        players.length
                    )
                )
            );
        }
    
    function pickWinner()
        public 
        restricted() 
        returns(address) {
            require(lottoStatus == Status.close, "Error : You must change phase to pick a winner");
            uint index = random() % players.length;
            address winner = players[index];
            delete players;
            (bool success, ) = winner.call{value : address(this).balance}("");
            require(success, "Failed");
            return winner;
        }
}