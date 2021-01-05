pragma solidity >=0.6.12;

import "./Library.sol";

contract customerRegistration{
    
    using myLibrary for myLibrary.UserReg;
    
    address[] CustomerArray;
    mapping(address => myLibrary.UserReg) CustomerReg;
    mapping(address => bool) CustomerExist;
    event CustomerRegistered(address who,string Name,string contactaddress,int256 number);
    
    constructor() public {
        
        CustomerArray.push(msg.sender);
        
    }
    
    // address Customer = msg.sender;
    
    modifier onlyCustomer{
        require(CustomerExist[msg.sender]==true,"This Portal is only for Customers");
        // require(CustomerArray.Customer.exists,"This portal is only for Customers");
        _;
    }
    
    
    function Register_as_Customer(string memory CustomerName,string memory ContactAddress,int256 PhoneNumber) public{
        CustomerReg[msg.sender] = myLibrary.UserReg(CustomerName,ContactAddress,PhoneNumber,true,false,false);
        CustomerExist[msg.sender] = true;
        CustomerArray.push(msg.sender);
        emit CustomerRegistered(msg.sender,CustomerName,ContactAddress,PhoneNumber);
    }
    
    function UpdateCustomerNumber(int256 New_Number) onlyCustomer public{
        CustomerReg[msg.sender].Phonenumber = New_Number;
    }
}