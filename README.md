![E-COMMERCE-LOGO](docs/img/ecom.png)

# E-commerce Database system

> Spring 2026 CPSC 332 - Phase 2: Implementation <br>
Team members: Erasmo Alcazar, Daniel Torres, Huy Ta <br>
California Sate University, Fullerton <br>

## Overview: 
The system is a database used to store any and all information related to our ecommerce company. In terms of users, there’ll be customers who will have basic login information to use the service, as well as employees who have more in depth information, such as an SSN for payroll. 

Along those lines, it could track an organization who could have multiple items listed under their account
Given that it’s for ecommerce, the system will need to track individual items, alongside their name, price, a unique ID, owner, and potentially other important information. It needs to track customer purchases, which could consist of a unique ID, item IDs, and the customer who purchased the item. It would contain purchase status needing the purchase ID and current status of the item (whether it's been delivered or sent out). Reviews can be made and will need to be stored, consisting of score, comments, and the user who sent them out.

## ER diagram 

// PIRCTURE OF THE DIAGRAM HERE - or link yk

## Key Relationships

Customers → Orders   <br> 
Employees → Orders   <br>
Orders → OrderItems  <br>
Products → OrderItems<br>
Orders ↔ Products    <br>
Customers → Reviews  <br>
Products → Reviews   <br>

## Business Rules & Constraints

- Items need to have a seller - Every item needs to have a valid reference. The item can't be created without having an existing seller 
- Unique customer accounts - customer emails have to be unique; there can’t be any duplicates.
- Item price can’t be negative - The price must be greater than zero. 
- The purchase status must be valid - The purchase status can only contain allowed values “PENDING, PROCESSING, CANCEL, and COMPLETED.” 
- SSN integrity - the SSN should be nine digits and unique. 
- Purchases need to reference a customer - every purchase needs to have a valid customer ID. 
- Employee salary must be nonnegative - The salary of the employee can be less than zero.
- The seller cannot review their own organization's items - The seller’s organization can’t be allowed to review items that they manage. 
- Organization/Seller name must be unique - Two different organizations/sellers can’t be listed under the same name.

### Project Info
Provider: Supabase (PostgreSQL) <br>
Contributors: @f3g790-rgb, @tonyt243, @DanielTorres890