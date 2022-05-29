# banking-contract

## running the project
1. open ganache UI
2. ```truffle compile```
3. ```truffle migrate```
4. ```truffle migrate reset```
5. ```npm run dev```


## contract
``` 
function deposit() public payable{
        
}
```
This is the deposit function that creates an acount in the bank if doesnt exist and deposit ether.


``` 
function withdraw(uint _amount) public{
```
Account holder can withdraw his deposited money from the contract.


``` 
function loan(uint256 amount) public {
```
Anybody can loan out from the bank using this function.

```
function repayment() public payable returns (uint256){
```
Loaned amount can be repayed using this function with additional interest.
