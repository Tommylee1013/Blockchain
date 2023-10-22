// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract quiz3 {
    enum Switch {
        turnOff,
        turnOn
    }

    Switch public lightStatus = Switch.turnOn;

    function turnOnTheLight()
        public {
            require(lightStatus == Switch.turnOff, "The light must be turned off");
            lightStatus = Switch.turnOn;
        }
    
    function turnOffTheLight()
        public {
            require(lightStatus == Switch.turnOn, "The light must be truned on");
            lightStatus = Switch.turnOff;
        }
}