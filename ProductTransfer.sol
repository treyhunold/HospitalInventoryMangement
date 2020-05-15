pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/drafts/Counters.sol";


contract ProductTransfer is ERC721Full {
    // List the locations that the products will be transferred to
    
    enum Location {
        Storage,
        // When Product is recieved from manufacturer
        Department,
        // List of different departments?
        Room
        // List of rooms?
        
        //Should we create a mneumonic phrase for both Departments and Nurses and assign address for each individual?
    }
    
    Location public location;
    
    event ProductTransfer(uint token_ID, string location);
    
    constructor() public {
        location = Location.Storage;
    }
        
    function TransferProductDepartment() public {
        ProductTransfer // event
        location = Location.Department;
        token_ID // Product token id that is being transferred to the room
        employee_ID // Employee (assigned address) id that is making the transfer and assuming responsiblity of product        
        departmentName // Name of department the product is being transferred to
    }

    function TransferProductRoom() public {
        ProductTransfer // event
        location = Location.Room;
        token_ID // Product token id that is being transferred to the room
        employee_ID // Employee (assigned address) id that is making the transfer and assuming responsiblity of product
        roomNumber // The room number the product is being tranferred to
    }
    
    function removeProduct() public {
        token_ID // Product token id that is being transferred to the room
        employee_ID // Employee (assigned address) id that is making the transfer and assuming responsiblity of product
        patientName // The patient name the product is being tranferred to
    }
}
