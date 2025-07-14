Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| anudip             |
| information_schema |
| join_table         |
| joins              |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
9 rows in set (0.12 sec)

mysql> use task1;
Database changed
mysql> Create table Customer(Customer_id varchar(10) not null primary key, Name varchar(30) not null, Email varchar(20) not null, City varchar(15) not null, Address varchar(50) not null, Pincode int(6) not null, Ph_no int(10) not null);
Query OK, 0 rows affected, 2 warnings (0.08 sec)

mysql> desc Customer;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Customer_id | varchar(10) | NO   | PRI | NULL    |       |
| Name        | varchar(30) | NO   |     | NULL    |       |
| Email       | varchar(20) | NO   |     | NULL    |       |
| City        | varchar(15) | NO   |     | NULL    |       |
| Address     | varchar(50) | NO   |     | NULL    |       |
| Pincode     | int         | NO   |     | NULL    |       |
| Ph_no       | int         | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> INSERT INTO Customer (Customer_id, Name, Email, City, Address, Pincode)
    -> VALUES
    -> ('C11', 'Riya', 'riya01@gmail.com', 'Thane', 'Near Station Road', 400601),
    -> ('C12', 'Amit', 'amit02@gmail.com', 'Navi Mumbai', 'Sector 5, Vashi', 400703),
    -> ('C13', 'Sneha', 'sneha03@gmail.com', 'Pune', 'Magarpatta City', 411028),
    -> ('C14', 'Rahul', 'rahul04@gmail.com', 'Nagpur', 'Dharampeth', 440010),
    -> ('C15', 'Neha', 'neha05@gmail.com', 'Kolhapur', 'Shahupuri', 416001);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0


 SELECT * FROM CUSTOMER;
+-------------+-------+-------------------+-------------+-------------------+---------+
| Customer_id | Name  | Email             | City        | Address           | Pincode |
+-------------+-------+-------------------+-------------+-------------------+---------+
| C11         | Riya  | riya01@gmail.com  | Thane       | Near Station Road |  400601 |
| C12         | Amit  | amit02@gmail.com  | Navi Mumbai | Sector 5, Vashi   |  400703 |
| C13         | Sneha | sneha03@gmail.com | Pune        | Magarpatta City   |  411028 |
| C14         | Rahul | rahul04@gmail.com | Nagpur      | Dharampeth        |  440010 |
| C15         | Neha  | neha05@gmail.com  | Kolhapur    | Shahupuri         |  416001 |
+-------------+-------+-------------------+-------------+-------------------+---------+
5 rows in set (0.01 sec)

CREATE table Product(Product_id varchar(10) not null primary key, Product_Name varchar(15) not null, Category varchar(15) not null, Sub_Category varchar(15) not null, Original_price int(10) not null, Selling_price int(10) not null, Stock int(10) not null);
 desc Product;
Query OK, 0 rows affected, 3 warnings (0.11 sec)
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| Product_id     | varchar(10) | NO   | PRI | NULL    |       |
| Product_Name   | varchar(15) | NO   |     | NULL    |       |
| Category       | varchar(15) | NO   |     | NULL    |       |
| Sub_Category   | varchar(15) | NO   |     | NULL    |       |
| Original_price | int         | NO   |     | NULL    |       |
| Selling_price  | int         | NO   |     | NULL    |       |
| Stock          | int         | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

 INSERT INTO Product values('P001', 'iPhone 14', 'Electronics', 'Smartphones', 80000, 76000, 15), ('P002', 'Galaxy S22', 'Electronics', 'Smartphones', 75000, 71000, 10), ('P003', 'Nike Shoes', 'Footwear', 'Sports Shoes', 5000, 4500, 25), ('P004', 'Dell Laptop', 'Electronics', 'Laptops', 60000, 58000, 8), ('P005', 'Wooden Chair', 'Furniture', 'Chairs', 3000, 2700, 20);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0


mysql>  SELECT * FROM PRODUCT;
+------------+--------------+-------------+--------------+----------------+---------------+-------+
| Product_id | Product_Name | Category    | Sub_Category | Original_price | Selling_price | Stock |
+------------+--------------+-------------+--------------+----------------+---------------+-------+
| P001       | iPhone 14    | Electronics | Smartphones  |          80000 |         76000 |    15 |
| P002       | Galaxy S22   | Electronics | Smartphones  |          75000 |         71000 |    10 |
| P003       | Nike Shoes   | Footwear    | Sports Shoes |           5000 |          4500 |    25 |
| P004       | Dell Laptop  | Electronics | Laptops      |          60000 |         58000 |     8 |
| P005       | Wooden Chair | Furniture   | Chairs       |           3000 |          2700 |    20 |
+------------+--------------+-------------+--------------+----------------+---------------+-------+
5 rows in set (0.00 sec)

 CREATE TABLE Orders (Order_id VARCHAR(10) PRIMARY KEY, Customer_id VARCHAR(10),  Product_id VARCHAR(10), Quantity INT NOT NULL, Total_price INT NOT NULL, Payment_mode VARCHAR(15),  Order_Date DATE, Order_Status VARCHAR(15), FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id), FOREIGN KEY (Product_id) REFERENCES Product(Product_id));
Query OK, 0 rows affected (0.09 sec)
INSERT INTO Orders VALUES('O001', 'C001', 'P001', 1, 76000, 'UPI', '2025-07-05', 'Delivered'), ('O002', 'C002', 'P002', 2, 142000, 'Card', '2025-07-06', 'Shipped'), ('O003', 'C003', 'P003', 1, 4500, 'Cash', '2025-07-07', 'Pending'), ('O004', 'C004', 'P004', 1, 58000, 'UPI', '2025-07-08', 'Delivered'), ('O005', 'C005', 'P005', 4, 10800, 'NetBanking', '2025-07-09', 'Cancelled');

 SELECT * FROM ORDERS;
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| Order_id | Customer_id | Product_id | Quantity | Total_price | Payment_mode | Order_Date | Order_Status |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
| O001     | C01         | P001       |        1 |       76000 | UPI          | 2025-07-05 | Delivered    |
| O002     | C02         | P002       |        2 |      142000 | Card         | 2025-07-06 | Shipped      |
| O003     | C03         | P003       |        1 |        4500 | Cash         | 2025-07-07 | Pending      |
| O004     | C04         | P004       |        1 |       58000 | UPI          | 2025-07-08 | Delivered    |
| O005     | C05         | P005       |        4 |       10800 | NetBanking   | 2025-07-09 | Cancelled    |
+----------+-------------+------------+----------+-------------+--------------+------------+--------------+
5 rows in set (0.00 sec)
