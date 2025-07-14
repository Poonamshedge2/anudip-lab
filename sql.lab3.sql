Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.42 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+---------------------+
| Database            |
+---------------------+
| anudip              |
| information_schema  |
| join_table          |
| joins               |
| mysql               |
| performance_schema  |
| sakila              |
| student_mgmt_system |
| sys                 |
| task1               |
| world               |
+---------------------+
11 rows in set (0.01 sec)

mysql> USE STUDENT_MGMT_SYSTEM;
Database changed

 create table student1(SID VARCHAR(10),FIRST_NAME VARCHAR(20),LAST_NAME VARCHAR(20));
Query OK, 0 rows affected (0.12 sec)

mysql> INSERT INTO student1 VALUES
    -> ('s001', 'aditya', 'birla'),
    -> ('s002', 'pari', 'varma'),
    -> ('s003', 'aahan', 'rao'),
    -> ('s004', 'karan', 'singh'),
    -> ('s005', 'aditi', 'kapoor'),
    -> ('s006', 'priyanka', 'deshmukh'),
    -> ('s007', 'vishwa', 'patil'),
    -> ('s008', 'sanika', 'chouhan'),
    -> ('s009', 'pallavi', 'mishra'),
    -> ('s010', 'yash', 'verma');
Query OK, 10 rows affected (0.02 sec)
Records: 10  Duplicates: 0  Warnings: 0


