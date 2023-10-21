// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface System {
    function versionCheck()
        external 
        returns(uint);
    
    function errorCheck()
        external 
        returns(bool);
    
    function boot()
        external 
        returns(uint, bool);
}

contract Computer is System {
    function versionCheck()
        public 
        pure 
        override 
        returns(uint) {
            return 5;
        }
    
    function errorCheck()
        public 
        pure 
        override 
        returns(bool) {
            return true;
        }
    
    function boot()
        public 
        pure 
        override 
        returns(uint, bool) {
            return (versionCheck(), errorCheck());
        }
}

contract Load {
    function versionCheck(address addr) 
        public 
        returns(uint) {
            return System(addr).versionCheck();
        }
    
    function errorCheck(address addr)
        public 
        returns(bool) {
            return System(addr).errorCheck();
        }
    
    function boot (address addr) 
        public 
        returns(uint, bool) {
            return System(addr).boot();
        }
}