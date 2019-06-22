// Set dependancies:
var inquirer = require("inquirer");
var mysql = require("mysql");
var Table = require("cli-table");
var colors = require('colors');

// Set connection to my local server to connect to mysql bamazon database:
var connection = mysql.createConnection ({
    host: "localhost",
    user: "root",
    password: "",
    port: 3306,
    database: "bamazon_db"
});

// Make connection to my local server and mysql bamazon database:
connection.connect(function(err) {
    if (err) throw err;
    console.log(

        "\n••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\n".blue +
        colors.bgBlue("Connected as id " + connection.threadId) +
        "\n••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\n".blue);
});

// Display available products in a table, formatted via "cli-table" module.
function showInventory() {
    connection.query("SELECT * FROM products", function(err, res) {
        if (err) throw err;
        console.log(

            "\n••••••••••••••••••••••••••• WELCOME TO BAMAZON •••••••••••••••••••••••••••\n".green);
            
            var displayTable = new Table ({
                head: ["ID:", "Product:", "Department:", "Price:", "Quantity:"],
                colWidths: [10,18,18,10,12]
            });
            for(var i = 0; i < res.length; i++){
                displayTable.push(
                    [res[i].item_id,res[i].product_name, res[i].department_name, res[i].price, res[i].stock_quantity]
                    );
                }
                console.log(displayTable.toString());
                console.log(

                "\n••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\n".green);

            startShopping();
    });
};

function startShopping() {
    inquirer
    .prompt([
        {
            name: "item_id",
            type: "input",
            message: "What is the Item ID of the product you would like to buy?",
            filter: Number
        },
        {
            name: "quantity",
            type: "input",
            message: "How many units of this product would you would like to buy?",
            filter: Number

        }
    ]).then(function(input) {
        var requestedId = input.item_id;
        var requestedQuantity = input.quantity;
        console.log(

        "\n––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––\n".yellow +
        colors.yellow("Confirming your request to purchase " + requestedQuantity + " of " + requestedId) +
        "\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– \n".yellow
        );

        processRequest(requestedId, requestedQuantity);
    });
};

function processRequest(requestedId, requestedQuantity){
	connection.query('Select * FROM products WHERE item_id = ' + requestedId, function(err,res){
		if(err){console.log(err)};
		if(requestedQuantity <= res[0].stock_quantity){
            var totalDue = res[0].price * requestedQuantity;
            console.log(
                colors.green("––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––\n" +
                "Confirming that the items you requested are in stock")
            );
            console.log(colors.green("...and your total cost for " + requestedQuantity + " " +res[0].product_name + " is " + totalDue));
            console.log(colors.green(        "––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––\n"));

			connection.query("UPDATE products SET stock_quantity = stock_quantity -" + requestedQuantity + " WHERE item_id = " + requestedId);
		} else{
			console.log(colors.bgRed("Insufficient quantity! Not enough " + res[0].product_name + " in stock to complete your order."));
		};
		showInventory();
	});
};

showInventory();