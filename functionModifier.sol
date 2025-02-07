// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract FunctionModifier {
    bool public paused = true; //true intial
    uint public count;

    function setPause(bool _paused) external   {
        paused = _paused;
    }

    modifier whenNotPaused(){
        require(!paused, "paused"); //!paused means paused == false
        _;
    }

    function inc () external  whenNotPaused {
        count += 1;
    }

    function dec () external whenNotPaused {
        count -= 1;
    }

    modifier cap(uint _x) {
        require(_x <100, "x >= 100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    modifier sandwich() {
        // this first executes
        count += 10;
        _;

        // The code executes here and the following logic will run
        count *= 2;
    }

    function foo () external whenNotPaused sandwich {
        count += 1;
    }


} 
