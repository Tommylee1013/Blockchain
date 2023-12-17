// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Ballot {
    struct Voter {
        uint weight;
        bool voted;
        uint vote;
    }

    struct Proposal {
        uint voteCount;
    }

    address chairperson;
    mapping(address => Voter) public voters;
    Proposal [] public proposals;

    enum Phase {
        Initialize,
        Register,
        Vote,
        Done
    }

    Phase public currentPhase = Phase.Initialize;

    modifier onlyChair() {
        require(msg.sender == chairperson, "Error : Only Chair Person can call this function");
        _;
    }

    modifier validVoter() {
        require(voters[msg.sender].weight > 0, "Error : Only valid voter can call this function");
        _;
    }

    modifier validPhase(Phase reqPhase) {
        require(currentPhase == reqPhase, "Error : Invalid Phase. Chack Phase again");
        _;
    }

    constructor(uint numProposals) {
        chairperson = msg.sender; // 의장 지정
        for (uint8 i = 0; i < numProposals; i++) {
            proposals.push(Proposal(0)); // push로 초기화
        }
    }

    function advancePhase() 
        public 
        onlyChair() {
            if (currentPhase == Phase.Initialize) {
                currentPhase = Phase.Register;
            } else if (currentPhase == Phase.Register) {
                currentPhase = Phase.Vote;
            } else if (currentPhase == Phase.Vote) {
                currentPhase = Phase.Done;
            } else {
                currentPhase = Phase.Initialize;
            }
        }
    
    function register(address _voter) 
        public 
        onlyChair() 
        validPhase(Phase.Register){
            if (_voter == chairperson) {
                voters[_voter].weight = 2;
            } else {
                voters[_voter].weight = 1;
            }
            voters[_voter].voted = false;
            voters[_voter].vote = 0;
        }

    function vote(uint toProposal)
        public 
        validVoter()
        validPhase(Phase.Vote) {
            require(toProposal < proposals.length, "Error : invalid votes");
            require(voters[msg.sender].voted == false, "Error : You have been already voted");

            proposals[toProposal].voteCount += voters[msg.sender].weight;

            voters[msg.sender].voted = true;
            voters[msg.sender].vote = toProposal;
        }
    
    function reqWinner()
        public 
        view
        validPhase(Phase.Done)
        onlyChair()
        returns(uint8 winningProposal) {
            winningProposal = 0;
            for (uint8 i = 0; i < proposals.length; i++) {
                if (proposals[i].voteCount > proposals[winningProposal].voteCount) {
                    winningProposal = i;
                }
            }
            return winningProposal;
        }
}