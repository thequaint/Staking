pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract staking {
    
    IERC20 testToken;

    mapping(address=>uint256) public tokenStake; 
    
    constructor() {
        
        testToken=IERC20(0x0fB4Dad893450522E2a77848d284BA4c7AeD6968);
    
    }

    function stake(uint256 numofToken) external {

        testToken.transferFrom(msg.sender,address(this),numofToken);

        tokenStake[msg.sender] +=numofToken;
 
    }

    function withdraw() external{
        
        require(tokenStake[msg.sender]>0,"No stake is available to withdraw");

        testToken.transfer(msg.sender,tokenStake[msg.sender]);
        
        tokenStake[msg.sender]=0;

    }

}
