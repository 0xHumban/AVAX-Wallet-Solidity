// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import './Owner.sol';
contract Wallet is Owner {

    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numPayements;
        mapping(uint => Payment) payements;
    }

    mapping(address => Balance) Wallets;


    function setupFreeze(bool _value) public Owner.isOwner(){
        Owner.freeze = _value;
    }

    function getFreeze() public view returns(bool) {
        return Owner.freeze;
    }


    function getTotalBalance() public Owner.isOwner() view returns(uint) {
        return address(this).balance;
    }

    function getBalance() public view returns(uint) {
        return Wallets[msg.sender].totalBalance;
    }


    function withdrawAllmoney(address payable _to) public Owner.isfrozen() {
        uint amount = Wallets[msg.sender].totalBalance;
        Wallets[msg.sender].totalBalance = 0;
        _to.transfer(amount);
    }


    function withdrawMoney(address payable _to, uint _amount) public Owner.isfrozen() {
        require(_amount <= Wallets[msg.sender].totalBalance,"Not enought funds");
        Wallets[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }


    receive() external payable Owner.isfrozen() {
        Payment memory thisPayement = Payment(msg.value, block.timestamp);
        Wallets[msg.sender].totalBalance += msg.value;
        Wallets[msg.sender].payements[Wallets[msg.sender].numPayements] = thisPayement;
        Wallets[msg.sender].numPayements ++;
    }



}
