pragma solidity >=0.6.12;

import "./Library.sol";

contract HotelRegistration{
    
    using myLibrary for myLibrary.UserReg;
    using myLibrary for myLibrary.hotelMenuCard;
    
    address[] HotelArray;
    mapping(address => myLibrary.UserReg) HotelReg;
    mapping(address => bool) hotelExist;
    mapping(string => myLibrary.hotelMenuCard) menuCard;
    mapping(address => mapping(string => bool)) Hotellist;
    event HotelRegistered(address who,string Name,string contactaddress,int256 number);
    
    constructor() public {
        
        HotelArray.push(msg.sender);
        
                 
    }
    
    address owner = msg.sender;
    
    modifier onlyManager{
        require(hotelExist[msg.sender]==true,"This Portal is only for Hotel Management");
        _;
    }
    
    
    
    function Register_as_Hotel(string memory HotelName,string memory ContactAddress,int256 PhoneNumber) public{
        HotelReg[msg.sender] = myLibrary.UserReg(HotelName,ContactAddress,PhoneNumber,false,true,false);
        hotelExist[msg.sender] = true;
        HotelArray.push(msg.sender);
        emit HotelRegistered(msg.sender,HotelName,ContactAddress,PhoneNumber);
    }
    
    
    function addItem(string memory Name,int256 Price) onlyManager public {
        menuCard[Name] = myLibrary.hotelMenuCard(Name, Price ) ;
        Hotellist[owner][Name] = true;
    }
    
    
    
    function updateMenu(string memory Name,int256 Price) onlyManager public{
        require(Hotellist[owner][Name]==true, "The item does not exist in the MenuCard");
        menuCard[Name] = myLibrary.hotelMenuCard(Name, Price ) ;
    }
    
    function RemoveItem(string memory Name)onlyManager public{
        require(Hotellist[owner][Name]==true, "The item does not exist in the MenuCard");
        Hotellist[owner][Name] = false;
    }
    
    // ************** This function is same as the function in main contract except i can access the data saved on the array in this contract but not via main contract ************//
    function SelectHotel (uint256 index_number )public view returns (string memory) {
        return HotelRegistration.HotelReg[HotelRegistration.HotelArray[index_number]].name;
    }
}
