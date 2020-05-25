pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/drafts/Counters.sol";


contract ProductTransfer is ERC721Full {
    // List the locations that the products will be transferred to
    
    // Person/department receiving product
    address public productReceiver;
    // Person/department sending the product
    
    
    // Current position within supply chain
    address public currentPosition;
    uint public currentSupply;
    
    // Quantity that is being transferred between lcoations
    uint public amountTransferred;
    
    
    // Make sure that the product exists
    modifier productRegistered(uint token_id) {
        require(_exists(token_id), "Product no longer in inventory");
        _;
    }
    
    // Import list of product to make mapping of inventory
    mapping(Product => uint) public inventory;
    
    
    // Indicate that transfer has ended
    bool public ended;
    

    event ProductTransferred(address sender, uint amount);
    event ProductReceived(address receiver, uint amount)
    
    constructor(
        address _receiver
    ) public {
        productReceiver = _receiver;
    }
    
    
    function transfer(address sender) public {
        require(
            msg.value > 0;
            msg.value < currentSupply;
        )
        
        currentPosition = sender;
        amountTransferred = msg.value;
        emit ProductTransferred(sender, msg.value)
        
        inventory[productReceiver] = inventory[productReceiver] + quantityTransferred;
        productReceiver = sender;
        quantityTransferred = msg.value;
        emit ProductTransferred(sender, msg.value);
    }
    
    
    function amountReceived() public {
        require(msg.sender == productReceiver, "You are not the intended receiver")
        
        ended = true;
        emit ProductReceived(currentPosition, amountTransferred);
        
        productReceiver.transfer(amountTransferred);
        
    }
    
    function updateInventory()
    
    // Give access to receiver to receive products
    function giveReceiveAccess(address productReceiver) public {
        require(
            msg.sender == currentPosition,
            "Only someone in current department is allowed to send inventory"
        )
    }
    
    //////////////
    
    
        
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
