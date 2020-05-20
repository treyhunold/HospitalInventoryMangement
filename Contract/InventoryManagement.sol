pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

contract InventoryManagement is ERC721Full {
    
    constructor() ERC721Full("InventoryToken", "INV") public { }
    
    using Counters for Counters.Counter;
    Counters.Counter token_ids;
    Counters.Counter product_ids;
    Counters.Counter location_ids;
    Counters.Counter employee_ids;
    
    // struct productDescription {
    //     string name;
    //     string description;
    //     string ExpirationDate;
    // }
    
    
    // mapping(uint => productDescription) public product_description;
    mapping(uint => string) public Inventory;
    mapping(uint => string) public Products;
    mapping(uint => string) public Locations;
    mapping(uint => string) public Employees;
    
    event TransferToken(uint token_id, uint product_id, uint location_id, uint employee_id, string token_uri);
    event ProductEvent();
    event LocationEvent();
    event EmployeeEvent();
    event InventoryUsedEvent();
    
    function RegisterNewInventory(uint employee_id, uint location_id, uint product_id, string memory token_uri) public returns(uint) {
        token_ids.increment();
        
        uint token_id = token_ids.current();
    
        Inventory[token_id] = token_uri();
        
        return token_id;
    }  
    // Event to manage the function and a struct to reference it
    //Registering a new piece of inventory (crypto fax excercise 22.1 for routing URI to Pinata)

    
}