pragma solidity >=0.6.12;

import "./Library.sol";

contract executiveRegistration{
    
    using myLibrary for myLibrary.UserReg;
    
    address[] executiveArray;
    mapping(address => myLibrary.UserReg) executiveReg;
    mapping(address => bool) executiveExist;
    
    event ExecutiiveRegistered(address who,string Name,string contactaddress,int256 number);
    
    constructor() public {
        
        executiveArray.push(msg.sender);
        
        
    }
    
    address Executive = msg.sender;
    
    modifier onlyExecutive{
        require(executiveExist[msg.sender]==true,"This Portal is only for Delivery Executives");
        _;
    }
    
    
    function Register_as_DeliveryExecutive(string memory ExecutiveName,string memory ContactAddress,int256 PhoneNumber) public{
        executiveReg[msg.sender] = myLibrary.UserReg(ExecutiveName,ContactAddress,PhoneNumber,false,false,true);
        executiveExist[msg.sender] = true;
        executiveArray.push(msg.sender);
        emit ExecutiiveRegistered(msg.sender,ExecutiveName,ContactAddress,PhoneNumber);
    }
    
    function UpdateContactNumber(int256 New_Number) onlyExecutive public{
        executiveReg[msg.sender].Phonenumber = New_Number;
    }
}