pragma solidity >=0.6.12;

library myLibrary {
    
    
     struct UserReg {
        string name;  
        string contactAddress;
        int256 Phonenumber; 
        bool isCustomer;
        bool isHotelManagement;
        bool isExecutive;
    }
    
    struct hotelMenuCard {
        string name;
        uint256 price;
    }
    
    struct payment{
        address hoteladdress;
        uint256 amount;
    }
    
    
    struct Auth{
        bool[] autharray;
    }
    
}


    
