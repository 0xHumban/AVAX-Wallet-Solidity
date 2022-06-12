pragma solidity ^0.8.7;

interface IWallet {

    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numPayements;
        mapping(uint => Payment) payements;
    }

    function setupFreeze(bool _value) external;
    function getFreeze() external view returns(bool);
    function getTotalBalance() external view returns(uint);
}