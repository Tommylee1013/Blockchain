// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ballot {
    struct Voter {
        uint weight; // 가중치
        bool voted; // 투표 여부
        uint vote; // 투표값
    }

    struct Proposal {
        uint voteCount; // 제안 상세 정보 (투표수)
    }

    address chairPerson;
    mapping(address => Voter) public voters; // 투표자 정보
    Proposal [] public proposals; // 제안들을 담는 배열

    modifier onlyChair() {
        require(msg.sender == chairPerson, "Error : Only Chair Person can call this function");
        _;
    }

    modifier validVoter() {
        require(voters[msg.sender].weight > 0, "Error : Only valid voter can call this function");
        _;
    }

    constructor(uint numProposals) {
        chairPerson = msg.sender; // 의장 지정
        for (uint8 i = 0; i < numProposals; i++) {
            proposals.push(Proposal(0)); // push로 초기화
        }
    }

    function register(address _addr) 
        public 
        onlyChair() {
            if (_addr == chairPerson) {
                voters[_addr].weight = 2;
            } else {
                voters[_addr].weight = 1;
            }
            voters[_addr].voted = false;
            voters[_addr].vote = 0;
        }
    
    function vote(uint8 _number)
        public 
        validVoter() {
            require(voters[msg.sender].voted == false, "Error : You have been already voted");
            require(_number < proposals.length, "Error : Invalid number");

            proposals[_number].voteCount += voters[msg.sender].weight; // 제안 업데이트

            voters[msg.sender].voted = true;
            voters[msg.sender].vote = _number;
        }
    
    function reqWinner()
        public 
        view 
        onlyChair()
        returns(uint8) {
            uint8 winnerIdx = 0;

            for (uint8 i = 0; i < proposals.length; i++) {
                if (proposals[winnerIdx].voteCount < proposals[i].voteCount) {
                    winnerIdx = i;
                }
            }
            return winnerIdx;
        }
}