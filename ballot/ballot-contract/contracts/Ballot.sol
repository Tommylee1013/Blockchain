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

    Proposal[] public proposals;

/*
    constructor () {
        chairman = msg.sender;
    }

    modifier onlyChair() {
        require(chairman == msg.sender, "Error : Only chairman can call a vote");
        _;
    }
*/
}