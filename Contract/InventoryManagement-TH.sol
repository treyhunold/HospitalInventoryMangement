pragma solidity ^0.5.0;
    
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
    
    
    // mapping(uint => productDescription) public product_description;
    mapping(uint => Item) public Inventory;
    mapping(uint => product_uri) public Products; // map to URI
    mapping(uint => location_uri) public Locations;
    mapping(uint => employee_uri) public Employees;
    
    
    
    event RegisterItem(uint employee_id, uint location_id, uint product_id);
    event RegisterProduct(string name, string description, uint quantity);
    event RegisterLocation(string name, string department);
    event RegisterEmployee(string name, string department, string role, uint accessLevel);
    
    event TransferItem(uint items_ids, uint product_id, uint location_id, uint employee_id, string item_uri);
    event UpdateProduct)string product_uri);
    event UpdateLocation(string location_uri);
    event UpdateEmployee(sting employee_uri);

    
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
        
        emit RegisterLocation(location_uri);
        
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
    
    function updateItem(uint item_id, uint product_id, string expiration_date, bool is_active, uint location_id) {

    }
    
    function updateProduct(uint product_id, sting product_uri) public {
        Products[product_id].product_uri = product_uri

        emit UpdateProduct(Products[product_id].product_uri)
    }

    function updateLocation(uint location_id, string location_uri) public {
        Locations[location_id].location_uri = location_uri

        emit UpdateLocation(Locations[location_id].location_uri)
    }
    
    function updateEmployee(uint employee_id, sting employee_uri) public {
        Employees[employee_id].employee_uri = employee_uri

        emit UpdateEmployee(Employees[employee_id].employee_uri)
    }
    
    //     function updateOwnerName(owner_id, name) {
    //     Owners[owner_id].name = name;
        
    //     emit updateOwner(Owners[owner_id].name, Owners[owner_id].age, Owners[owner_id].pets)
    // }

    
    
    
    // Event to manage the function and a struct to reference it
    //Registering a new piece of inventory (crypto fax excercise 22.1 for routing URI to Pinata)

    
}