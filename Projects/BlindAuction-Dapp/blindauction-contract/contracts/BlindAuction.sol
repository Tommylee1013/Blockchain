// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract BlindAuction {

    struct Bid {
        bytes32 blindedBid;
        uint deposit;
    }

    enum Phase {
        Init, 
        Bidding, 
        Reveal, 
        Done
    }

    address payable public beneficiary;
    address public highestBidder;
    uint public highestBid;

    mapping(address => Bid) public bids;
    mapping(address => uint) pendingReturns;

    Phase public currentPhase = Phase.Init;

    event AuctionEnded(address winner, 
                       uint highestBid);
    event BiddingStarted();
    event RevealStarted();
    event AuctionInit();

    modifier onlyBeneficiary() {
        require(msg.sender == beneficiary, "Only beneficiary can call this");
        _;
    }

    modifier inPhase(Phase _phase) {
        require(currentPhase == _phase, "Invalid phase");
        _;
    }

    constructor() {
        beneficiary = payable(msg.sender);
    }

    function advancePhase() 
        public 
        onlyBeneficiary() {
        if (currentPhase == Phase.Done) {
            revert("Auction already ended");
        }
        if (currentPhase == Phase.Init) {
            currentPhase = Phase.Bidding;
            emit BiddingStarted();
        } else if (currentPhase == Phase.Bidding) {
            currentPhase = Phase.Reveal;
            emit RevealStarted();
        } else if (currentPhase == Phase.Reveal) {
            currentPhase = Phase.Done;
            emit AuctionEnded(highestBidder, highestBid);
        }
    }

    function bid(bytes32 _blindedBid) 
        public 
        payable 
        inPhase(Phase.Bidding) {
        bids[msg.sender] = Bid(
            {
            blindedBid : _blindedBid,
            deposit : msg.value
            }
        );
    }

    function reveal(uint _value, 
                    bytes32 _password) 
        public 
        inPhase(Phase.Reveal) {
        uint refund;
        Bid storage bidToCheck = bids[msg.sender];

        if (bidToCheck.blindedBid == keccak256(abi.encodePacked(_value, _password)) && bidToCheck.deposit >= _value) {
            if (_value > highestBid) {
                highestBid = _value;
                highestBidder = msg.sender;
            }
            refund = bidToCheck.deposit - _value;
        } else {
            refund = bidToCheck.deposit;
        }

        bidToCheck.blindedBid = bytes32(0);
        pendingReturns[msg.sender] += refund;
    }

    function withdraw() 
        public {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            pendingReturns[msg.sender] = 0;

            payable(msg.sender).transfer(amount);
        }
    }

    function auctionEnd() 
        public 
        onlyBeneficiary() 
        inPhase(Phase.Done) {
        beneficiary.transfer(highestBid);
    }
}
