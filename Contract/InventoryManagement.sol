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
    event RegisterProduct(uint product_id, string product_uri);
    event RegisterLocation(uint location_id, string location_uri);
    event RegisterEmployee(uint employee_id, string employee_uri);
    
    event TransferItem(uint employee_id, uint item_id, uint product_id, string expiration_date, uint location_id, string item_uri);
    event UpdateProduct(uint product_id, string product_uri);
    event UpdateLocation(uint location_id, string location_uri);
    event UpdateEmployee(uint employee_id, string employee_uri);
    
    function registerNewItem(uint employee_id, uint location_id, uint product_id, string memory expiration_date, bool is_active, string memory item_uri) public returns(uint) {
        
        item_ids.increment();
        
        uint item_id = item_ids.current();
    
        Inventory[item_id] = Item(product_id, expiration_date, is_active, location_id, employee_id, item_uri);
    
        emit RegisterItem(product_id, location_id, employee_id);
        
        return item_id;

    }
    
    function registerNewProduct(uint product_id, /*string name, string description*/ string memory product_uri) public returns(uint) {
        product_ids.increment();
        
        product_id = product_ids.current();
        
        Products[product_id] = product_uri;
        
        Products[product_id].name =
        
        emit RegisterProduct(product_id, product_uri);
        
        return product_id;
    }
    
    function registerNewLocation(uint location_id, string memory location_uri) public returns(uint) {
        location_ids.increment();
        
        location_id = product_ids.current();
        
        Locations[location_id] = location_uri;
        
        emit RegisterLocation(location_id, location_uri);
        
        return location_id;
    }
    
    function registerNewEmployee(uint employee_id, string memory employee_uri) public returns(uint) {
        employee_ids.increment();
        
        employee_id = location_ids.current();
        
        Employees[employee_id] = employee_uri;
        
        emit RegisterEmployee(employee_id, employee_uri);
        
        return employee_id;
    }

    function updateItem(uint employee_id, uint item_id, uint product_id, string memory expiration_date, uint location_id, string memory item_uri) public {
        Inventory[item_id].item_uri = item_uri;
        
        emit TransferItem(employee_id, item_id, product_id, expiration_date, location_id, item_uri);
    }
    
    function updateProduct(uint product_id, string memory product_uri) public {
        Products[product_id] = product_uri;

        emit UpdateProduct(product_id, product_uri);
    }

    function updateLocation(uint location_id, string memory location_uri) public {
        Locations[location_id] = location_uri;

        emit UpdateLocation(location_id, location_uri);
    }
    
    function updateEmployee(uint employee_id, string memory employee_uri) public {
        Employees[employee_id] = employee_uri;

        emit UpdateEmployee(employee_id, employee_uri);
    }
    // Event to manage the function and a struct to reference it
    //Registering a new piece of inventory (crypto fax excercise 22.1 for routing URI to Pinata)
}