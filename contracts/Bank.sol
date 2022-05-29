pragma solidity ^0.8.0;


contract Bank{
    
    mapping(address => uint) public balances;
    mapping(address => uint) public bankLoans;
    uint256 safetyMargin = 5;
    uint256 interest = 0.02 ether;

    function deposit() public payable{
        balances[msg.sender] += msg.value; 
    }

    function loan(uint256 amount) public {
        require(address(this).balance/safetyMargin > amount, "Not enough ether in the contract");
        bankLoans[msg.sender] += amount+interest;
        (bool sent,) = msg.sender.call{value: amount}("Sent");
        require(sent, "failed to send ETH");
    }

    function repayment() public payable returns (uint256){
        require(msg.value <= bankLoans[msg.sender], "You have paid more than required");
        bankLoans[msg.sender] -= msg.value;
        return bankLoans[msg.sender];
    }
     
    function withdraw(uint _amount) public{
        require(balances[msg.sender] >= _amount, "Not enough ether");
        balances[msg.sender] -= _amount;
        (bool sent,) = msg.sender.call{value: _amount}("Sent");
        require(sent, "failed to send ETH");

        
    }

    function getBal() public view returns(uint){
        return address(this).balance;
    }




}