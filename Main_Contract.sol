pragma solidity >=0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

import "./Library.sol";

import "./CustomerRegistration.sol";

import "./HotelRegistration.sol";

import "./ExecutiveRegistration.sol";

contract mainContract is customerRegistration, HotelRegistration, executiveRegistration  {


//*************************************** ICO Part ***********************************//
   IERC20 token;
    
    address Deployer;
    
    constructor() public {
        Deployer = msg.sender;
    }
    
    function _setToken(address _token) public {
        token = IERC20(_token);
    }
    
    function _buyTokens(uint256 count) public payable {
        require(msg.value >= 34000000 gwei , "Send atleast 34000000 Gwei to Buy a Token");
        require(count >= 1, " Buy ateast one Token");
        
        token.transferFrom(owner,msg.sender,count);
    }
    
    
    
//*************************************** ICO Part -end ***********************************//
    
    modifier onlyHolder{
        require(token.balanceOf(msg.sender)>100,"You should hold atleast 100 fOOdi tokens to perform this Transaction");
        _;
    }
    
    
    
//*************************************** Customer Part ***********************************//

    using myLibrary for myLibrary.payment;
    
    
    mapping(address => myLibrary.payment) paymentDetails;
    
    string[] item_ordered;
    
    uint256[] item_price;
    
    mapping(address => string[]) OrderedCustomerList; 
    
    address hotelAdd ;
    
    mapping( uint256 => myLibrary.Auth ) Authlist;
    
    uint256 count = 0;
    
    uint256[] hotelPrepareList;
    
    event Customer_Confirmation(address who,bool Status);
    
    event Hotel_Confirmation(address who,bool Status);
    
    event Executive_Confirmation(address who,bool Status);
    
    function _SelectHotel (uint256 index_number )public returns (string memory) {
        hotelAdd = HotelRegistration.HotelArray[index_number];
        return HotelRegistration.HotelReg[hotelAdd].name;
    }

    function _Selectitem (string memory item_name)public view returns (uint256){
        require(HotelRegistration.itemlist[item_name]==true,"Item Unavailable, Please select another item");
        return HotelRegistration.menuCard[item_name].price;
       
    }
    
    
    function Add_to_cart (string memory item_name) onlyHolder public{
        
        require(HotelRegistration.itemlist[item_name]==true,"Item Unavailable, Please select another item");
        item_ordered.push(item_name);
        item_price.push(HotelRegistration.menuCard[item_name].price);
        
  
    }
    
    function Confirm_and_Checkout (bool ) onlyHolder public{
        
        
        
        OrderedCustomerList[msg.sender] = item_ordered;
        uint256 sum_ = 0;
        for (uint i = 0; i < item_price.length; i++) {
            sum_ += item_price[i];
        }
        
        delete item_price;
        delete item_ordered;
        
        paymentDetails[msg.sender] = myLibrary.payment(hotelAdd,sum_);
        hotelPrepareList.push(sum_);
        token.transferFrom(msg.sender,owner,sum_);
        
        count = sum_;
        
    }
    
    function Auth_Customer(bool confirm) onlyCustomer public returns (string memory){
        
        
        Authlist[1].autharray.push(confirm);
        emit Customer_Confirmation(msg.sender,confirm);
        if(confirm == true){
            token.transferFrom(owner,HotelArray[1],count*2);
            token.transferFrom(owner,executiveArray[1],count+40);
            return "The Order is Delivered Successfully";
        }
        else{
            feedBackArray[executiveArray[1]].push(1);
        }
        
    }
    

//*************************************** Customer Part -end ***********************************//



//*************************************** Hotel Part  ******************************************//

    function view_Bill() public view returns(uint256){
        return count;
    }

    function Prepare_Food()onlyHolder onlyManager public returns(string memory){
        
        token.transferFrom(msg.sender,owner,count);
        return "Food is Ready to be picked by Executive";
        
    }
    
    function Auth_Hotel(bool confirm) onlyManager public returns(string memory){
        
        Authlist[1].autharray.push(confirm);
        emit Hotel_Confirmation(msg.sender,confirm);
        return "The Payment will be Credited soon, after Confirmation";
        
    }
    
//*************************************** Hotel Part - end ******************************************//



//*************************************** Executive Part  ******************************************//
    
    function Pick_Order()onlyHolder onlyExecutive public returns(string memory){
        
        token.transferFrom(msg.sender,owner,count);
        return "The order is Picked form Hotel and Out for Delivery";
    }
    
    function Auth_Executive(bool confirm) onlyExecutive public returns(string memory){
    
        Authlist[1].autharray.push(confirm);
        emit Executive_Confirmation(msg.sender,confirm);
        // FinalCheck();
        
    }
    
//*************************************** Executive Part - end ******************************************//
    
    
//*************************************** Automation   ******************************************//

   mapping(address => uint256[]) feedBackArray;
    
    function FinalCheck() private  {
        
        bool Customer_Status=Authlist[1].autharray[1];
        bool Hotel_Status=Authlist[1].autharray[2];
        bool Executive_Status=Authlist[1].autharray[3];
        
        address _Customer = CustomerArray[1];
        address _Hotel = HotelArray[1];
        address _Executive = executiveArray[1];
        
        if(Customer_Status == Hotel_Status == Executive_Status == true){
            token.transferFrom(owner,_Hotel,count*2);
            token.transferFrom(owner,_Executive,count+40);
        }
        else if(Hotel_Status == Executive_Status == true && Customer_Status == false){
            token.transferFrom(owner,_Customer,count);
            token.transferFrom(owner,_Hotel,count*2);
        }
        else{
            token.transferFrom(owner,_Hotel,count);
            token.transferFrom(owner,_Customer,count);
            token.transferFrom(owner,_Executive,count);
        }
    }
    
    
    function feedback(uint256 _feedback)onlyCustomer public returns(string memory){
        feedBackArray[executiveArray[1]].push(_feedback);
        return "Thanks for the Order, Happy Eating! Save Food";
    }
}







