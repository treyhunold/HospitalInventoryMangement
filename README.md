# HospitalInventoryMangement

## Business Objective: 

Using smart contracts we can safely and securely move inventory products down the intra-organizational supply chain of the hospital from when it is delivered by the distributor to the product being used on patients. Once the inventory is received at the docking station a sku/QR code will be created for each piece of inventory to track the product. From there it goes to the onsite storage facility for their inventory to the department that needs it, to the pharmacy within that department, to the nurse and then to the patient. 

## Project Description

Hospital Inventory Management is an application that uses the Ethereum blockchain to make intra-hospital transactions of inventory. With the growing adoption of the blockchain to increase security and accuracy, this serves as an opportunity for an industry such as the healthcare system to improve its integrity. 

### Smart Contract Creation

Created a smart contract in Solidity that uses the Ethereum blockchain to apply rules for the inventory management system.
* Create IDs for specific inventory items, product category, location, and employee
* Define events to register and update inventory
* Create functions that emit events and saves URIs of transactions

### Python Interaction

Created a Python file products.py file to interact with the smart contract. We created a workflow for the user to input information using the terminal that consists of a series of questions asking the user what information to input. 
* Define functions that requests input from user for item information
* Save and send information in JSON to an IPFS and records the hash

### IPFS Interaction

Establish the connection to a Pinata account to save information to an IPFS. Data is saved in JSOn format and can be accessed through IPFS hash.


## Inventory (item_ids) - Individual Items
## Product (product_ids) - Types of Items
## Location (location_ids) - Where the items are
## Employee (employee_ids) - Who is transferring the item

## Mint Token ID (creating a new ID for a new element of Inventory)
Counter Function
Mapping ID to Inventory	

## Function: Register New Inventory
Mapping ID to Inventory
Add inventory
Create new record
Provide metadata
Product_id URI
Expiration Date
Date automatically created
Count of inventory
Product Expiration Date: (02/02/22)
Product Quantity: (100)

## Event: Transfer Token Event
Uint Location ID from
Uint Location ID to
Uint Product ID
Uint employee ID
Uint Token ID
String report_url
Metadata:
Time Departed
Time Arrived
Truck Number
Truck Driver Name

## Function: Register Product ID (Descriptor)
Counter Function
Mapping ID to Product
String report_URL
Metadata:
Product Name: (Tylenol)
Product Type: (PM)

## Event: Product Event
(Parameters) - whatever information you want to have when you access the URI
Uint Token ID
Uint Product ID
String report_URL
Metadata:
Product Name: (Tylenol)
Product Type: (PM)

## Function: Register Location ID (Descriptor) (creating a new ID for new element of Location)
Counter Function
Mapping ID to Location
Location Type
Location Subtype

## Event: Location Event
(Parameters) - whatever information you want to have when you access the URI

## Function: Search Product Event function
Types of Product

## Function: Search Location Event function
Inventory per location

## Function: Register Employee ID (Descriptor)
Counter Function
Mapping ID to EmployeeDatabase
Employee Name
Employee number

## Event: Employee Event
(Parameters) - whatever information you want to have when you access the URI

## Event: Inventory Used Event
Location ID from
Location ID final destination 
Product ID
Token ID
Transferrer address
Metadata:
Patient Name
Room Number
Date of event

## Function: Search Inventory Used Event
Search through products and view metadata to determine whether or not they need to be removed (in the URI layer).