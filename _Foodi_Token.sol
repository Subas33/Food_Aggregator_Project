pragma solidity >=0.6.0 <0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract foodiToken is ERC20 {
    
    address public owner;
    
    constructor(string memory name, string memory symbol, uint256 count) ERC20(name, symbol) public {
        
        owner = msg.sender;
        _mint(msg.sender, count * 10 ** 18);
        
    }
}
