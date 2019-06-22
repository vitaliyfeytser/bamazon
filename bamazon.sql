DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;
USE bamazon;

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    item_id INTEGER(10) AUTO_INCREMENT NOT NULL,
    product_name VARCHAR(30),
    department_name VARCHAR(30),
    price FLOAT(10),
    stock_quantity INTEGER(10),
    PRIMARY KEY (item_id)
);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("1", "Microwave Oven",          "Kitchen",          "399",    "15",      "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("2", "Toaster",                 "Kitchen",          "35",     "15",              "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("3", "Blender",                 "Kitchen",          "139",    "15",              "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("4", "iPhone",                  "Electronics",      "499",    "15",                  "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("5", "iPad",                    "Electronics",      "699",    "15",          "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("6", "MacBook Pro",             "Electronics",      "1299",   "15",          "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("7", "To Kill a Mocking Bird",  "Books",            "23",     "15",      "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("8", "A Game of Thrones",       "Books",            "29",     "15",      "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("9", "The Way of Kings",        "BoBooksb",         "33",     "15",  "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("10", "The Last Empire",         "Books",            "21",     "15",  "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("11", "Unf*ck Yourself",         "Books",            "15",     "15",              "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("12", "Pool Chlorine Tablets",   "Home Goods",       "109",    "15",      "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("13", "Foldable Lawn Chair",     "Home Goods",       "29",     "15",      "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("14", "Baskeball",               "Home Goods",       "12",     "15",  "2019-04-06 22:18:59");
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity, created_at) VALUES ("15", "Tennis Racket",           "Home Goods",       "49",     "15",       "2019-04-06 22:18:59");


SELECT * FROM products;