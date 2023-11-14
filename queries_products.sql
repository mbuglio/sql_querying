products_db=# INSERT INTO products(name, price,can_be_returned)
VALUES('chair','44.00','false');
INSERT 0 1
--inserting new product into table--
products_db=# SELECT * FROM products
products_db-# ;
 id | name  | price | can_be_returned 
----+-------+-------+-----------------
  2 | chair |    44 | f
(1 row)


products_db=# INSERT INTO products(name, price, can_be_returned)
products_db-# VALUES ('stool','25.99','true');
INSERT 0 1
products_db=# INSERT INTO products(name,price, can_be_returned)
products_db-# VALUES('table','124.00','false');
INSERT 0 1
--inserting new product into table--
products_db=# SELECT * FROM products
products_db-# ;
 id | name  | price | can_be_returned 
----+-------+-------+-----------------
  2 | chair |    44 | f
  3 | stool | 25.99 | t
  4 | table |   124 | f
(3 rows)
--viewing table to confirm product additions--

products_db=# SELECT name FROM products
products_db-# ;
 name  
-------
 chair
 stool
 table
(3 rows)
--displaying all the names of products--

products_db=# SELECT name, price FROM products;
 name  | price 
-------+-------
 chair |    44
 stool | 25.99
 table |   124
(3 rows)
--displaying all the names and prices of products--

products_db=# INSERT INTO products(name, price, can_be_returned)
products_db-# VALUES('sofa','199.99','false');
INSERT 0 1
--inserting a new product--
products_db=# SELECT name FROM products
products_db-# WHERE can_be_returned = 'true';
 name  
-------
 stool
(1 row)
--displaying products that can be returned--

products_db=# SELECT name FROM products
products_db-# WHERE price < '44.00';
 name  
-------
 stool
(1 row)
--displaying products that cost less than $44--

products_db=# SELECT name, price FROM products
products_db-# WHERE price BETWEEN 22.50 AND 99.99;
 name  | price 
-------+-------
 chair |    44
 stool | 25.99
(2 rows)
--displaying products between the prices of $22.50 and $99.99--

products_db=# UPDATE products SET price = price -20;
UPDATE 4
products_db=# SELECT * FROM products
products_db-# ;
 id | name  |       price       | can_be_returned 
----+-------+-------------------+-----------------
  2 | chair |                24 | f
  3 | stool | 5.989999999999998 | t
  4 | table |               104 | f
  5 | sofa  |            179.99 | f
(4 rows)
--updating products for the sale, taking $20 off price--

products_db=# DELETE FROM products WHERE price < 25;
DELETE 2
products_db=# SELECT * FROM products;
 id | name  | price  | can_be_returned 
----+-------+--------+-----------------
  4 | table |    104 | f
  5 | sofa  | 179.99 | f
(2 rows)
--removing products that are less than $25--

products_db=# UPDATE products SET price = price +20;
UPDATE 2
--updating products to increase in $20--
products_db=# UPDATE products SET can_be_returned = 'true';
UPDATE 2
--updating all products to be returnable--
products_db=# SELECT * FROM products;
 id | name  | price  | can_be_returned 
----+-------+--------+-----------------
  4 | table |    124 | t
  5 | sofa  | 199.99 | t
(2 rows)
--displaying the final table to check all updates--