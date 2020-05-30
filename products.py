import sys
from inventory import convertDataToJSON, pinJSONtoIPFS, initContract, w3
import requests as r

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
        "item_id": item_id,
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
        "product_description": product_description
    }
    
    json_data = convertDataToJSON(product)
    product_uri = pinJSONtoIPFS(json_data)

    tx_hash = InventoryManagement.functions.registerNewProduct(product_id, product_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    
    return receipt

def registerNewLocation():
    location_id = int(input("Location ID: "))
    location_name = input("Location name: ")
    location_department = input("Location department: ")

    location = {
        "location_id": location_id,
        "location_name": location_name,
        "location_department": location_department
    }
    
    json_data = convertDataToJSON(location)
    location_uri = pinJSONtoIPFS(json_data)

    tx_hash = InventoryManagement.functions.registerNewLocation(location_id, location_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    
    return receipt
    
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

    tx_hash = InventoryManagement.functions.registerNewEmployee(employee_id, employee_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    
    return receipt

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

    json_data = convertDataToJSON(item)
    item_uri = pinJSONtoIPFS(json_data)

    tx_hash = InventoryManagement.functions.updateItem(employee_id, item_id, product_id, expiration_date, location_id, item_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return receipt

def updateProduct(product_id):
    product_description = input("Description of the product: ")

    product = {
        "product_description": product_description
    }
    
    json_data = convertDataToJSON(product)
    product_uri = pinJSONtoIPFS(json_data)

    tx_hash = InventoryManagement.functions.updateProduct(product_id, product_uri).transact(
        {"from": w3.eth.accounts[0]}
    )

    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return receipt

def updateLocation(location_id):
    location_name = input("Location name: ")
    location_department = input("Location department: ")

    location = {
        "location_name": location_name,
        "location_department": location_department
    }
    
    json_data = convertDataToJSON(location)
    location_uri = pinJSONtoIPFS(json_data)

    tx_hash = InventoryManagement.functions.updateLocation(location_id, location_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return receipt
    
def updateEmployee(employee_id):
    employee_name = input("Name of the employee: ")
    employee_department = input("Department of employee: ")
    employee_role = input("Job position of employee: ")
    employee_access_level = input("Level of access: ")

    employee = {
        "employee_name": employee_name,
        "employee_department": employee_department,
        "employee_role": employee_role,
        "employee_access_level": employee_access_level
    }
    
    json_data = convertDataToJSON(employee)
    employee_uri = pinJSONtoIPFS(json_data)

    tx_hash = InventoryManagement.functions.updateEmployee(employee_id, employee_uri).transact(
        {"from": w3.eth.accounts[0]}
    )
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return receipt 

def get_data_from_uri(uri_hash):
    hash = r.get(f"https://ipfs.io/ipfs/{uri_hash}").json()
    return hash


if __name__ == "__main__":

    action = input("Do you want to register, update, or view information? ")

    if action == "register":
        register = input("What are you trying to register: ")

        if register == "item":
            receipt = registerNewitem()
            print("Report IPFS Hash", receipt)
        elif register == "product":
            receipt = registerNewProduct()
            print("Report IPFS Hash", receipt)
        elif register == "location":
            receipt = registerNewLocation()
            print("Report IPFS Hash", receipt)
        elif register == "employee":
            receipt = registerNewEmployee()
            print("Report IPFS Hash", receipt)
        else:
            print("Please input item, product, location, or employee and start over again.")
            

    elif action == "update":
        update = input("What are you updating? ")
    
        if update == "item":
            receipt = updateItem()
            print("Report IPFS Hash", receipt)
        elif update == "product":
            product_id = int(input("What product's ID are you updating? "))
            receipt = updateProduct(product_id)
            print("Report IPFS Hash", receipt)
        elif update == "location":
            location_id = int(input("What location's ID are you updating? "))
            receipt = updateLocation(location_id)
            print("Report IPFS Hash", receipt)
        elif update == "employee":
            employee_id = int(input("What employee's ID are you updating? "))
            receipt = updateEmployee(employee_id)
            print("Report IPFS Hash", receipt)
        else:
            print("Please input item, product, location, or employee and start over again.")

    elif action == "view":
        hash = input("What is the hash of the information you are trying to view? ")
        receipt = get_data_from_uri(hash)
        print(receipt)
    else:
        print("Please input register, update, or view information and start again.")
        
