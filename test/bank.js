const Bank = artifacts.require("Bank");



/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */

let accounts;
let instance;

beforeEach(async () => {
  accounts = await web3.eth.getAccounts();
  
  instance = await Bank.deployed();
  });
contract("Bank", function (/* accounts */) {
  it("should return the balance", async ()=> {
    
    const value = await instance.getBal();
 
    assert.equal(value, 0);
  });
  it("should return balance of contract after entering", async ()=>{
    await instance.deposit({
      from: accounts[1],
      value: web3.utils.toWei('2', 'ether'),
      gas: '1000000'
    });
    const valueO = await instance.getBal();
    assert.equal(valueO,2000000000000000000);

  });

  it("should return balance after the first account withdraws one ether", async () =>{
    await instance.withdraw(web3.utils.toWei('1', 'ether'),{
      from: accounts[1],
      gas: '1000000'
    });
    const value = await instance.getBal();
    assert.equal(value,1000000000000000000);
  });
   
});
