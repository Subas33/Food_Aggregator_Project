pragma solidity >=0.6.12;

library myLibrary {
    
    // enum role = {Customer, Hotel, DeliveryExecutive};
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
        int256 price;
    }
    
}
    //  function CustomerRegistration(string memory CustomerName, string memory ContactAddress,int8 PhoneNumber) public {
    //     // Registration Fee is no Needed as the Customer should buy some Tokens to Order something
        
    //     UserReg storage Reg = UserReg(Customername,ContactAddress,PhoneNumber,true, false, false);
    //     UserRegistration[msg.sender] = Reg;
    //     customerArray.push(msg.sender);
        
    // }
    
    //  function HotelRegistration(string memory HotelName, string memory ContactAddress, int8 PhoneNumber) public {
    //     // Registration Fee is no Needed as the Customer should buy some Tokens to Order something
        
    //     UserReg storage Reg = UserReg(HotelName,ContactAddress,PhoneNumber, false, true, false);
    //     UserRegistration[msg.sender] = Reg;
    //     HotelArray.push(msg.sender);
        
    // }
    
    // function DeliveryExecutiveRegistration(string memory ExecutiveName, string memory ContactAddress, int8 PhoneNumber) public {
    //     // Registration Fee is no Needed as the Customer should buy some Tokens to Order something
        
    //     UserReg storage Reg = UserReg(ExecutiveName,ContactAddress,PhoneNumber, false, false, true);
    //     UserRegistration[msg.sender] = Reg;
    //     ExecutiveArray.push(msg.sender);
        

    