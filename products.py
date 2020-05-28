import sys
from crypto import convertDataToJSON, pinJSONtoIPFS, initContract, w3

from pprint import pprint

inventory_management = initContract()

def registerNewitem():
    product_id = int(input("Product ID of the item: "))
    expiration_date = input("Expiration date of the item: ")
    is_active = input("Is the item still active?: ")
    location_id = int(input("Location ID: ")
    employee_id = int(input("Employee ID: ")
    
    json_data = convertDataToJSON(product_id, expiration_date, expiration_date, is_active, location_id, employee_id)
    uri = pinJSONtoIPFS(json_data)
    
    return item_id, uri
    

def registerNewProduct():
    product_id = int(input("Product ID of the item: " ))
    product_description = input("Description of the product: ")
    
    json_data = convertDataToJSON(product_id, product_description)
    product_uri = pinJSONtoIPFS(json_data)
    
    return product_id, product_uri
    

def registerNewLocation():
    location_id = int(input("Location ID: "))
    location_name = input("Location name: ")
    
    json_data = convertDataToJSON(location_id, location_name)
    location_uri = pinJSONtoIPFS(json_data)
    
    return location_id, location_uri
    
    
def registerNewEmployee():
    employee_id = int(input("Emploee ID of employee: "))
    employee_name = input("Name of the employee: ")
    employee_role = input("Job position of employee: ")
    
    json_data = convertDataToJSON(employee_id, employee_name, employee_role)
    employee_uri = pinJSONtoIPFS(json_data)
    
    return employee_id, employee_uri
    



def updateItem(item_id, product_id, location_id, employee_id, expiration_date, item_uri):
    tx_hash = InventoryManagement.functions.updateItem(token_id, product_id, location_id, employee_id, expiration_date, item_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return receipt

def updateProduct(product_id, product_uri):
    tx_hash = InventoryManagement.functions.updateProduct(product_id, product_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return receipt

def updateLocation(location_id, location_uri):
    tx_hash = InventoryManagement.functions.updateLocation(location_id, location_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return receipt
    
def updateEmployee(employee_id, employee_uri):
    tx_hash = InventoryManagement.functions.updateEmployee(employee_id, employee_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return receipt
    
    
    
    
    function updateProduct(uint product_id, string memory product_uri) public {
        Products[product_id] = product_uri;

        emit UpdateProduct(product_id, product_uri);
    }
    
    
    function updateItem(uint employee_id, uint item_id, uint product_id, string memory expiration_date, uint location_id, string memory item_uri) public {
        Inventory[item_id].item_uri = item_uri;
        
        emit TransferItem(employee_id, item_id, product_id, expiration_date, location_id, item_uri);
    }
 