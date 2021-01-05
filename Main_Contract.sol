pragma solidity >=0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

import "./Library.sol";

import "./CustomerRegistration.sol";

import "./HotelRegistration.sol";

import "./ExecutiveRegistration.sol";

contract mainContract is customerRegistration, HotelRegistration, executiveRegistration  {

   
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
    
    function _SelectHotel (uint256 index_number )public view returns (string memory) {
        return HotelRegistration.HotelReg[HotelRegistration.HotelArray[index_number]].name;
    }

    
}