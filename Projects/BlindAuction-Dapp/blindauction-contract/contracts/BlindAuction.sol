// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract BlindAuction {
    struct Bid {
        bytes32 blindedBid;
        uint deposit;
    }

    // Init - 0; Bidding - 1; Reveal - 2; Done - 3
    enum Phase {Init, Bidding, Reveal, Done}

    // Owner
    address payable public beneficiary;

    // Keep track of the highest bid,bidder
    address public highestBidder;
    uint public highestBid = 0;

    // Only one bid allowed per address
    mapping(address => Bid) public bids;
    mapping(address => uint) pendingReturns;

    Phase public currentPhase = Phase.Init;

    // Events
    event AuctionEnded(address winner, uint highestBid);
    event BiddingStarted();
    event RevealStarted();
    event AuctionInit();

    // Modifiers

    constructor() {
    }

    function advancePhase() public {
    }

    function bid(bytes32 blindBid) public {
    }

    function reveal(uint value, bytes32 secret) public {
    }

    // Withdraw a non-winning bid
    function withdraw() public {
    }

    // Send the highest bid to the beneficiary and end the auction
    function auctionEnd() public {
    }
}
