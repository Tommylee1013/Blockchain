// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract HotelRoom {

    enum Status{
        Vacant,
        Occupied
    }

    address payable owner;

    uint amount = 10 ether;

    event Occupy(address _occupant, uint _value);

    Status public currentStatus = Status.Vacant;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Status.Vacant;
    }

    modifier onlyWhileVacant() {
        require(currentStatus == Status.Vacant, "Error : The room is not vacant");
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Error : Not enough ether provided");
        _;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Error : you are not owner");
        _;
    }

    function reset()
        public 
        onlyOwner() {
            currentStatus = Status.Vacant;
        }

    function book() 
        public 
        payable
        onlyWhileVacant() 
        costs(amount) {
            currentStatus = Status.Occupied;
            owner.transfer(msg.value);

            emit Occupy(msg.sender, msg.value);
        }

    function setAmount(uint _amount) 
        public
        onlyOwner() {
            amount = _amount * 1 ether;
        }
}