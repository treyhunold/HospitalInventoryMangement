pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/drafts/Counters.sol";

contract ProductRegister is ERC721Full {

    constructor() ERC721Full("InventoryToken") public{}
    
    using Counters for Counters.Counter;
    Counters.Counter token_ids;
    
    struct Product {
        string name;
        string description;
        uint price;
        // address public serialNumber;        //
    }
    
    mapping(uint -> Product) public inventory;
    
    event Register(uint token_ID, uint price, string report_uri);
    
    function registerProduct (address owner, string memory name, string memory description, uint price, string memory token_uri) public returns(uint) {
        token_ids.increment();
        uint token_id = token_ids.current();
        _mint(owner, token_id);
        _setToken(token_id, token_uri);
        inventory[token_id] = Product(name, description, price);
        return token_id;
    }

}