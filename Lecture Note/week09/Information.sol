// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfoService {
    struct ContractInfo {
        address contractOwner;
        address contractAddress;
        string description;
    }

    uint public numContracts;

    mapping(string => ContractInfo) public registeredContracts;

    modifier onlyOwner(string memory _name) {
        require(registeredContracts[_name].contractOwner == msg.sender, "Error : Only Contract owner can change information");
        _;
    }

    constructor() {
        numContracts = 0;
    }

    function registerContract(string memory _name,
                              address _contractAddress,
                              string memory _discription) 
        public {
            require(registeredContracts[_name].contractAddress == address(0), "Error : You already registered our system");
            // ContractInfo(msg.sender, _contractAddress, _discription)
            registeredContracts[_name].contractOwner = msg.sender;
            registeredContracts[_name].contractAddress = _contractAddress;
            registeredContracts[_name].description = _discription;
            numContracts ++;
        }

    function unregisterContract(string memory _name) 
        public 
        onlyOwner(_name) {
            require(registeredContracts[_name].contractAddress != address(0), "Error : You've not registered our system");
            delete registeredContracts[_name];
            numContracts --;
        }

    function changeOwner(string memory _name, 
                         address _newOwner) 
        public 
        onlyOwner(_name) {
            registeredContracts[_name].contractOwner = _newOwner;
        }
    
    function getOwner(string memory _name) 
        public 
        view
        returns(address){
            return registeredContracts[_name].contractOwner;
        }

    function setAddr(string memory _name, 
                     address _addr) 
        public 
        onlyOwner(_name) {
            registeredContracts[_name].contractAddress = _addr;
        }
    
    function getAddr(string memory _name)
        public 
        view
        returns(address) {
            return registeredContracts[_name].contractAddress;
        }
    
    function setDescription(string memory _name, 
                            string memory _description)
        public 
        onlyOwner(_name) {
            registeredContracts[_name].description = _description;
        }
    
    function getDescription(string memory _name)
        public 
        view
        returns (string memory) {
            return registeredContracts[_name].description;
        }
}