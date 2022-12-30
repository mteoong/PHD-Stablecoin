pragma solidity ^0.8.0;

import { PHDTokenV1 } from "./PHDTokenV1.sol";

contract Burner {
    address public owner;
    address public _addr = 0x79753E87EF9b08092681Bad5f244329E5b6e88F5;
    PHDTokenV1 PHDContract = PHDTokenV1(_addr);

    constructor() {
		owner = msg.sender;
	}

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _; 
    }

    function setOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function burn(uint256 amount) public onlyOwner {
        require(PHDContract.balanceOf(address(this)) >= amount, "Not enough funds in the contract.");

        PHDContract.burn(amount);
    }

    function changeAddr(address addr) public onlyOwner {
        _addr = addr;
        PHDContract = PHDTokenV1(_addr);
    }
}