pragma solidity ^0.8.0;

import { PHDTokenV1 } from "./PHDTokenV1.sol";

contract Minter {
    //state variable to keep track of owner and amount of ETHER to dispense
    address public owner;
    uint public amountAllowed = 10000000;
    address public _addr = 0x79753E87EF9b08092681Bad5f244329E5b6e88F5;
    PHDTokenV1 PHDContract = PHDTokenV1(_addr);

    //mapping to keep track of requested rokens
    //Address and blocktime + 1 day is saved in TimeLock
    mapping(address => uint) public lockTime;

    //constructor to set the owner
	constructor() {
		owner = msg.sender;
	}

    //function modifier
    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _; 
    }

    //function to change the owner.  Only the owner of the contract can call this function
    function setOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    //function to set the amount allowable to be claimed. Only the owner can call this function
    function setAmountallowed(uint newAmountAllowed) public onlyOwner {
        amountAllowed = newAmountAllowed;
    }

    //function to donate funds to the faucet contract
	function donateTofaucet() public payable {
	}

    //function to send tokens from faucet to an address
    function requestTokens(address payable _requestor, uint256 amount) public {
        //perform a few checks to make sure function can execute
        require(block.timestamp > lockTime[msg.sender], "lock time has not expired. Please try again later");
        require(amountAllowed >= amount, "Don't be greedy.");
        require(PHDContract.minterAllowance(address(this)) >= amount, "Not enough funds in the faucet. Please donate");

        PHDContract.mint(address(this), amount);
        PHDContract.transfer(msg.sender, amount);        
 
        //updates locktime 1 day from now
        lockTime[msg.sender] = block.timestamp + 1 days;
    }

    function changeAddr(address addr) public onlyOwner {
        _addr = addr;
        PHDContract = PHDTokenV1(_addr);
    }
}