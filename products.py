import sys
from inventory import convertDataToJSON, pinJSONtoIPFS, initContract, w3

from pprint import pprint

InventoryManagement = initContract()


def registerNewitem():
    item_id = int(input("Item ID: "))
    product_id = int(input("Product ID of the item: "))
    expiration_date = input("Expiration date of the item: ")
    is_active = bool(input("Is the item still active?: "))
    location_id = int(input("Location ID: "))
    employee_id = int(input("Employee ID: "))

    item = {
        "product_id": product_id,
        "expiration_date": expiration_date,
        "is_active": is_active,
        "location_id": location_id,
        "employee_id": employee_id
    }
    
    json_data = convertDataToJSON(item)
    item_uri = pinJSONtoIPFS(json_data)

    tx_hash = InventoryManagement.functions.registerNewItem(employee_id, location_id, product_id, expiration_date, is_active, item_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return receipt

    

def registerNewProduct():
    product_id = int(input("Product ID of the item: " ))
    product_description = input("Description of the product: ")

    product = {
        "product_id": product_id,
        "product_description": product_id
    }
    
    json_data = convertDataToJSON(product)
    product_uri = pinJSONtoIPFS(json_data)
    
    return product_id, product_uri
    

def registerNewLocation():
    location_id = int(input("Location ID: "))
    location_name = input("Location name: ")
    location_department = input("Location department: ")

    location = {
        "location_id": location_id,
        "location_name": location_name
    }
    
    json_data = convertDataToJSON(location)
    location_uri = pinJSONtoIPFS(json_data)
    
    return location_id, location_uri
    
    
def registerNewEmployee():
    employee_id = int(input("Employee ID of employee: "))
    employee_name = input("Name of the employee: ")
    employee_department = input("Department of employee: ")
    employee_role = input("Job position of employee: ")
    employee_access_level = input("Level of access: ")

    employee = {
        "employee_id": employee_id,
        "employee_name": employee_name,
        "employee_department": employee_department,
        "employee_role": employee_role,
        "employee_access_level": employee_access_level
    }
    
    json_data = convertDataToJSON(employee)
    employee_uri = pinJSONtoIPFS(json_data)
    
    return employee_id, employee_uri
    



def updateItem():
    item_id = int(input("Item ID: "))
    product_id = int(input("Product ID of the item: "))
    expiration_date = input("Expiration date of the item: ")
    is_active = input("Is the item still active?: ")
    location_id = int(input("Location ID: "))
    employee_id = int(input("Employee ID: "))

    item = {
        "product_id": product_id,
        "expiration_date": expiration_date,
        "is_active": is_active,
        "location_id": location_id,
        "employee_id": employee_id
    }

    tx_hash = InventoryManagement.functions.updateItem(item).transact(
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
    
    
if __name__ == "__main__":
    # item_id, item_uri = registerNewitem()

    action = input("Are you registering or updating information? ")

    if action == "register":
        register = input("What are you trying to register: ")

        if register == "item":
            receipt = registerNewitem()
            print("Report IPFS Hash", receipt)

    elif action == "update":
        update = input("What are you updating? ")
    
        if update == "item":
            receipt = updateItem()
            print(receipt)

        



        
