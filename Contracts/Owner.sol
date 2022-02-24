pragma solidity ^0.8.7;

contract Owner {

    address owner;
    bool freeze;

    constructor() {
        owner = msg.sender;
        freeze = false;
    }

    modifier isfrozen() {
        require(freeze == false,"Wallets are currently frozen");
        _;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }
}