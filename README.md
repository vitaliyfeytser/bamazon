# Bamazon

Bamazon is an Amazon-like storefront with the MySQL as the backbone of the database. The app will take in orders from customers and deplete stock from the store's inventory.

# How does it work?
Pretty simple: user will call bamazonCustomer.js app from the command line and will choose which items they are interested in purchasing.  When the user calls the app, the current inventory will populate and provide user with necessary details such as item IDs for corresponding products:

## User Setup
1. Install MySQL on your machine, if necessary
2. Clone bamazon
3. Run NPM Install for the following dependencies
    * Console.table
    * Inquirer
    * MySQL
    * Colors

![customerView](https://github.com/vitaliyfeytser/bamazon/blob/master/images/bamazon.png)



# Technologies used:
* Node.js
* NPM console.table
* NPM MySQL
* NPM Inquirer
* JavaScript
* MySQL Database
