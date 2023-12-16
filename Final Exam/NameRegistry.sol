// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NameRegistry {
    struct ContractInfo {
        address contractOwner;
        address contractAddress;
        string description;
    }

    uint public numContracts;
    mapping(string => ContractInfo) public registeredContracts;

    modifier onlyOwner(string memory _name) {
        require(registeredContracts[_name].contractOwner == msg.sender, "Error : you are not owner");
        _;
    }

    constructor() {
        numContracts = 0;
    }

    function registerContract(
        string memory _name,
        address _contractAddress,
        string memory _description
    )   public {
        require(registeredContracts[_name].contractOwner == address(0), "Error : you are already registered!");
        registeredContracts[_name].contractOwner = msg.sender;
        registeredContracts[_name].contractAddress = _contractAddress;
        registeredContracts[_name].description = _description;
        numContracts++;
    }

    function unregisterContract(
        string memory _name
    )   public 
        onlyOwner(_name) {
            require(registeredContracts[_name].contractOwner != address(0), "Error : you are not registed our system!");
            delete registeredContracts[_name];
            numContracts--;
        }
    
    function changerOwner(
        string memory _name,
        address _newOwner
    )   public 
        onlyOwner(_name) {
            registeredContracts[_name].contractOwner = _newOwner;
        }
    
    function getOwner(
        string memory _name
    )   public 
        view 
        returns(address) {
            return registeredContracts[_name].contractOwner;
        }

    function setAddress(
        string memory _name,
        address _addr
    )   public 
        onlyOwner(_name) {
            registeredContracts[_name].contractAddress = _addr;
        }
    
    function getAddress(
        string memory _name
    )   public 
        view 
        returns(address) {
            return registeredContracts[_name].contractAddress;
        }
    
    function setDescription(
        string memory _name,
        string memory _description
    )   public 
        onlyOwner(_name) {
            registeredContracts[_name].description = _description;
        }
    
    function getDescription(
        string memory _name
    )   public 
        view 
        returns(string memory) {
            return registeredContracts[_name].description;
        }
}