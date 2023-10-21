// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz3 {

    struct Market {
        string itemName;
        uint price;
    }

    Market [] public openMarket;

    function sell(string memory item, uint _price)
        public {
            openMarket.push(Market(item, _price));
        }
    
    function search(string memory item) 
        public 
        view 
        returns(uint) {
            for (uint idx = 0; idx < openMarket.length; ++idx) {
                if (keccak256(bytes(openMarket[idx].itemName)) == keccak256(bytes(item))) {
                    return openMarket[idx].price;
                }
            } 
            return 0;
        }

}