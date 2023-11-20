// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Ballot {
    struct Voter {
        uint weight;
        bool voted; // 투표 여부 확인
        uint vote; // 투표할 제안, 0은 초기값
    }

    struct Proposal {
        uint voteCount;
    }

    address chairperson;

    mapping(address => Voter) public voters;

    Proposal[] public proposals;

    constructor (uint8 numProposals) {
        chairperson = msg.sender;
        for (uint8 idx = 0; idx < numProposals; idx ++){
            proposals.push(Proposal(0));
        }
    }

    modifier onlyChair() {
        require(chairperson == msg.sender, "Error : Only chairman can call a vote");
        _;
    }

    modifier validVoter() {
        require(voters[msg.sender].weight > 0, "Not a registered voter");
        _;
    }

    function register(address _voter) 
        public 
        onlyChair() { 
            if (_voter == chairperson) {
                voters[_voter].weight = 2;
            } else {
                voters[_voter].weight = 1;
            }
            voters[_voter].voted = false;
            voters[_voter].vote = 0;
        }
    
    function vote(uint8 _number)
        public 
        validVoter() {
            require(voters[msg.sender].voted == false, "Error : You already have been voted");
            require(_number < proposals.length, "Error : invalid number");

            voters[msg.sender].voted = true;
            voters[msg.sender].vote = _number;

            proposals[_number].voteCount += voters[msg.sender].weight;
        }

    function reqWinner() 
        public 
        view 
        returns(uint) {
            uint maxIdx = 0;
            uint maxValue = proposals[0].voteCount;

            for(uint idx = 1; idx < proposals.length; idx++) {
                if(proposals[idx].voteCount > maxValue) {
                    maxValue = proposals[idx].voteCount;
                    maxIdx = idx;
                }
            }
            return (maxIdx);
        }
}