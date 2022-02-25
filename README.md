# AVAX Wallet in Solidity
 A traditional AVAX wallet with solidity.
 
 Deploy on Avax Fuji Testnet.
 
```
 You can test it with fake AVAX : 
```
- [AVAX Faucet](https://faucet.avax-test.network/)
 
 If you want test you can use Remix and copy-paste contract address, and play with functions !
 
 > I will try to create a simple Web-app to make it easier !
 
 
## Contract :
 Contract address (**Wallet.sol**) : [0xAda039DB9466C4035d704387F9DbcFDC90B02EC6](https://testnet.snowtrace.io/address/0xada039db9466c4035d704387f9dbcfdc90b02ec6)
 
 Contract address (**Owner.sol**) :  [0x11E045aA6ddA52492b2e803c86eEF05529b2708E](https://testnet.snowtrace.io/address/0x11e045aa6dda52492b2e803c86eef05529b2708e)
 
## Functions :

- `setupFreeze()` **possibility for the owner to freeze the application**
- `getfreeze()` to see if app are forzen
- `getBalance()` to see of many you have in your wallet
- `withdrawAllMoney()` wthdraw all of your money in your wallet to an external address
- `withdrawMoney()` withdraw part of your money in your wallet to an external address
- `receive()` allows you to deposit money in your wallet

