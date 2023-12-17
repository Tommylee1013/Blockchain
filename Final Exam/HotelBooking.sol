// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HotelRoom {
    enum Status {
        Vacant,
        Occupied
    }

    address payable owner;

    event Occupy(
        address _occupant, 
        uint _value
    );

    Status public currentStatus;

    uint amount = 10 ether;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Status.Vacant;
    }

    modifier onlyWhileVacant(Status reqStatus) {
        require(currentStatus == reqStatus, "Error : The room is not vacant");
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value > _amount, "Error : Not enough ether provided");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Error : you are not hotel owner");
        _;
    }

    function book()
        public 
        payable
        onlyWhileVacant(Status.Vacant)
        costs(amount) {
            currentStatus = Status.Occupied;
            (bool success, ) = owner.call{value : msg.value}("");
            require(success, "Error : Failed to send Ether");
            emit Occupy(msg.sender, msg.value);
        }
    
    function reset()
        public 
        onlyOwner() {
            currentStatus = Status.Vacant;
        }
}