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

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAllmoney(address payable _to) public {
        uint amount = Wallets[msg.sender].totalBalance;
        Wallets[msg.sender].totalBalance = 0;
        _to.transfer(amount);
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= Wallets[msg.sender].totalBalance,"Not enought funds");
        Wallets[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }

    receive() external payable {
        Payment memory thisPayement = Payment(msg.value, block.timestamp);
        Wallets[msg.sender].totalBalance += msg.value;
        Wallets[msg.sender].payements[Wallets[msg.sender].numPayements] = thisPayement;
        Wallets[msg.sender].numPayements ++;
    }



}