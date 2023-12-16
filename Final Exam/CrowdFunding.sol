// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfund {
    struct Investor { // 구조체 정의
        address addr;
        uint amount;
    }

    mapping (uint => Investor) public investors;

    address public owner; // 컨트랙트 소유자
    uint public numInvestors; // 투자자의 수
    uint public deadline; // 마감일
    string public status; // 모금활동 상태
    bool public ended; // 모금 종료여부
    uint public goalAmount; // 목표액
    uint public totalAmount; // 총 투자액

    modifier onlyOwner() {
        require(msg.sender == owner, "Error : only owner can call this function");
        _;
    }

    constructor(
        uint _duration,
        uint _gaolAmount) {
            owner = msg.sender;

            deadline = block.timestamp + _duration;
            goalAmount = _gaolAmount;
            status = "Funding";
            ended = false;

            numInvestors = 0;
            totalAmount = 0;
        }

    function fund()
        public 
        payable {
            require(msg.value > 0, "Error");
            require(ended == false, "Error : funding finished");

            investors[numInvestors].addr = msg.sender;
            investors[numInvestors].amount += msg.value;

            totalAmount += msg.value;
            numInvestors ++;
        }
    
    function checkGoalReached() 
        public 
        onlyOwner() {
            require(ended == false, "Error : funding finished");
            require(deadline <= block.timestamp, "Error : funding finished");

            if (totalAmount >= goalAmount) {
                (bool success, ) = owner.call{value : address(this).balance}("");
                require(success, "Error : revert");
                status = "campaign succeeded";
            } else {
                for (uint i = 0; i < numInvestors; i++) {
                    payable(investors[i].addr).transfer(investors[i].amount);
                }
                status = "campaign failed";
            }
            ended = true;
        }
}