// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrowdFund {

    struct Investor {
        address addr;
        uint amount;
    }

    address public owner;
    uint public numInvestors;
    uint public deadline;
    string public status;
    bool public ended;
    uint public goalAmount;
    uint public totalAmount;

    mapping (uint => Investor) public investors;

    constructor(uint _duration, uint _goalAmount) {
        owner = msg.sender;

        deadline = block.timestamp + _duration;
        goalAmount = _goalAmount * 1 ether;
        status = "Funding";
        ended = false;

        numInvestors = 0;
        totalAmount = 0;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Error : caller is not the owner"); 
        _; 
    }

    function fund()
        public 
        payable {
            require(msg.value > 0, "Error: Value must be greater than 0"); 
            require(ended == false, "Error: The fund is ended");
            investors[numInvestors].addr = msg.sender; 
            investors[numInvestors].amount = msg.value;

            totalAmount += investors[numInvestors].amount;
            numInvestors += 1;
        }
    
    function checkGoalReached() 
        public 
        onlyOwner() {
            require(!ended, "Error : The fund is not ended yet");
            require(deadline <= block.timestamp, "Error: The fund is not ended yet");
            if (totalAmount >= goalAmount) {
                for (uint i = 0; i < numInvestors; i++) {
                    payable(owner).transfer(address(this).balance);
                }
                status = "Campaign Succeeded";
            } else {
                for (uint i = 0; i < numInvestors; i++) {
                    payable(investors[i].addr).transfer(investors[i].amount);
                }
                status = "Campaign Failed";   
            }
            ended = true;
        }
}