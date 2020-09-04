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