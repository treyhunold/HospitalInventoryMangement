pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

contract InventoryManagement is ERC721Full {
    
    constructor() ERC721Full("InventoryToken", "INV") public { }
    
    using Counters for Counters.Counter;
    Counters.Counter items_ids;
    Counters.Counter product_ids;
    Counters.Counter location_ids;
    Counters.Counter employee_ids;
    
    // struct productDescription {
    //     string name;
    //     string description;
    //     string ExpirationDate;
    // }
    
    struct Item {
        uint product_id;
        string expiration_date;
        // use require to verify if product is expired
        bool is_active; // ??
        uint location_id;
    }
    
    // Do need product struct because is already created in web3
    // struct Product {
    //     string name;
    //     // string description => mapping to URI
    //     uint quantity;
    // }
    
    //  location id is already created
    // struct Location {
    //     string name; // this can be in URI
    //     string department;
    // }
    
    
    //
    // struct Employee {
    //     string name;
    //     string deparment;
    //     string role;
    //     uint accessLevel;
    // }
    
    
    // mapping(uint => productDescription) public product_description;
    mapping(uint => Item) public Inventory;
    mapping(uint => string) public Products; // map to URI
    mapping(uint => string) public Locations;
    mapping(uint => string) public Employees;
    
    
    
    event RegisterItem(uint employee_id, uint location_id, uint product_id);
    event RegisterProduct(string name, string description, uint quantity);
    event RegisterLocation(string name, string department);
    event RegisterEmployee(string name, string department, string role, uint accessLevel);
    
    event TransferItem(uint items_ids, uint product_id, uint location_id, uint employee_id, string item_uri);
    event LocationEvent();
    event EmployeeEvent();
    event InventoryUsedEvent();
    
    modifier is_active(item_id) {
        require(Inventory[item_id].is_active);
        _;
    }
    
    function registerNewItem(uint employee_id, uint location_id, uint product_id) public returns(uint) {
        
        items_ids.increment();
        
        uint item_id = item_ids.current();
    
        Inventory[item_id] = Item(product_id, expiration_date, is_active, location_id);
    
        emit RegisterItem(product_id, location_id, employee_id);
        
        return item_id;

    }
    
    function registerNewProduct(string memory product_uri) public returns(uint) {
        product_ids.increment();
        
        uint product_id = product_ids.current();
        
        Products[product_id] = product_id;
        
        emit RegisterProduct(product_uri);
        
        return product_id;
    }
    
    
    
    function registerNewLocation(string memory location_uri) public returns(uint) {
        location_ids.increment();
        
        uint product_id = product_ids.current();
        
        Locations[location_id] = location_id;
        
        emit RegisterLocation(location uri);
        
        return location_id
    }
    
    function registerNewEmployee(string memory employee_uri) public returns(uint) {
        employee_ids.increment();
        
        uint location_id = location_ids.current();
        
        Employees[employee_id] = employee_id;
        
        emit RegisterEmployee(employee_uri);
    }
    
    
    
    
    function itemLocationTransfer()
    
    
    function updateAccessLevel
    
    
    
    function updateItem
    
    function updateProduct
    
    function updateLocation
    
    function updateEmployee
    
    
    
    
    // Event to manage the function and a struct to reference it
    //Registering a new piece of inventory (crypto fax excercise 22.1 for routing URI to Pinata)

    
}