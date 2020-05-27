pragma solidity ^0.5.0;
    
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

contract InventoryManagement {
    
    using Counters for Counters.Counter;
    Counters.Counter item_ids;
    Counters.Counter product_ids;
    Counters.Counter location_ids;
    Counters.Counter employee_ids;
    
    struct Item {
        uint product_id;
        string expiration_date;
        bool is_active;
        uint location_id;
        uint employee_id;
        string item_uri;
    }
    
    mapping(uint => Item) public Inventory;
    mapping(uint => string) public Products;
    mapping(uint => string) public Locations;
    mapping(uint => string) public Employees;
    
    event RegisterItem(uint employee_id, uint location_id, uint product_id);
    // event RegisterProduct(string name, string description, uint quantity);
    // event RegisterLocation(string name, string department);
    // event RegisterEmployee(string name, string department, string role, uint accessLevel);
    event RegisterProduct(string product_uri);
    event RegisterLocation(string location_uri);
    event RegisterEmployee(string employee_uri);
    
    event TransferItem(uint item_id, uint product_id, uint location_id, uint employee_id, string item_uri);
    event UpdateProduct(string product_uri);
    event UpdateLocation(string location_uri);
    event UpdateEmployee(string employee_uri);
    
    function registerNewItem(uint employee_id, uint location_id, uint product_id, string memory expiration_date, bool is_active, string memory item_uri) public returns(uint) {
        
        item_ids.increment();
        
        uint item_id = item_ids.current();
    
        Inventory[item_id] = Item(product_id, expiration_date, is_active, location_id, employee_id, item_uri);
    
        emit RegisterItem(product_id, location_id, employee_id);
        
        return item_id;

    }
    
    function registerNewProduct(string memory product_uri) public returns(uint) {
        product_ids.increment();
        
        uint product_id = product_ids.current();
        
        emit RegisterProduct(product_uri);
        
        return product_id;
    }
    
    function registerNewLocation(string memory location_uri) public returns(uint) {
        location_ids.increment();
        
        uint location_id = product_ids.current();
        
        emit RegisterLocation(location_uri);
        
        return location_id;
    }
    
    function registerNewEmployee(string memory employee_uri) public returns(uint) {
        employee_ids.increment();
        
        uint employee_id = location_ids.current();
        
        emit RegisterEmployee(employee_uri);
    }

    function updateItem(uint employee_id, uint item_id, uint product_id, string memory expiration_date, uint location_id, string memory item_uri) public {
        Inventory[item_id].item_uri = item_uri;
        
        emit TransferItem(item_id, product_id, location_id, employee_id, item_uri);
    }
    
    function updateProduct(uint product_id, string memory product_uri) public {
        Products[product_id].product_uri = product_uri;

        emit UpdateProduct(product_uri);
    }

    function updateLocation(uint location_id, string memory location_uri) public {
        Locations[location_id].location_uri = location_uri;

        emit UpdateLocation(Locations[location_id].location_uri);
    }
    
    function updateEmployee(uint employee_id, string memory employee_uri) public {
        Employees[employee_id].employee_uri = employee_uri;

        emit UpdateEmployee(Employees[employee_id].employee_uri);
    }
    // Event to manage the function and a struct to reference it
    //Registering a new piece of inventory (crypto fax excercise 22.1 for routing URI to Pinata)
}