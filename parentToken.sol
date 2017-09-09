pragma solidity ^0.4.11;

import './IERC20.sol'; 
import './SafeMath.sol';

contract owned {
    address public owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
}


contract tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData); }

contract ParentToken {

     /* library used for calculations */
    using SafeMath for uint256; 

    /* Public variables of the token */
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address=>uint)) allowance;        



    /* Initializes contract with initial supply tokens to the creator of the contract */
    function ParentToken(uint256 currentSupply,
        string tokenName,
        uint8 decimalUnits,
        string tokenSymbol){
            
       balances[msg.sender] =  currentSupply;    // Give the creator all initial tokens  
       totalSupply = currentSupply;              // Update total supply 
       name = tokenName;                         // Set the name for display purposes
       decimals = decimalUnits;                  // Decimals for the tokens
       symbol = tokenSymbol;					// Set the symbol for display purposes	
    }
    
    
