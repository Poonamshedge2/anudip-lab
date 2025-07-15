//innerjoin,outerjoin,leftouterjoin,rightouterjoin
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.42 MySQL Community Server - GPL
Copyright (c) 2000, 2025, Oracle and/or its affiliates.
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
mysql> select * from student1;
+------+------------+-----------+
| SID  | FIRST_NAME | LAST_NAME |
+------+------------+-----------+
| s001 | aditya     | birla     |
| s002 | pari       | varma     |
| s003 | aahan      | rao       |
| s004 | karan      | singh     |
| s005 | aditi      | kapoor    |
| s006 | priyanka   | deshmukh  |
| s007 | vishwa     | patil     |
| s008 | sanika     | chouhan   |
| s009 | pallavi    | mishra    |
| s010 | yash       | verma     |
+------+------------+-----------+
10 rows in set (0.00 sec)

 CREATE TABLE ENROLLMENT1 ( ENROLLMENT1_ID INT PRIMARY KEY, SID VARCHAR(10) NOT NULL, COURSE_ID VARCHAR(10) NOT NULL, FOREIGN KEY (SID) REFERENCES STUDENT(SID));
Query OK, 0 rows affected (0.11 sec)

mysql> desc enrollment1;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| ENROLLMENT1_ID | int         | NO   | PRI | NULL    |       |
| SID            | varchar(10) | NO   | MUL | NULL    |       |
| COURSE_ID      | varchar(10) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)
mysql>  INSERT INTO ENROLLMENT1 VALUES (1, 'S001', 'C101'), (2, 'S002', 'C102'), (3, 'S003', 'C101'), (4, 'S004', 'C103'), (5, 'S005', 'C104'), (6, 'S006', 'C101'), (7, 'S007', 'C102'), (8, 'S008', 'C104'), (9, 'S009', 'C103'), (10, 'S010', 'C101');
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0
mysql> select * from enrollment1;
+----------------+------+-----------+
| ENROLLMENT1_ID | SID  | COURSE_ID |
+----------------+------+-----------+
|              1 | S001 | C101      |
|              2 | S002 | C102      |
|              3 | S003 | C101      |
|              4 | S004 | C103      |
|              5 | S005 | C104      |
|              6 | S006 | C101      |
|              7 | S007 | C102      |
|              8 | S008 | C104      |
|              9 | S009 | C103      |
|             10 | S010 | C101      |
+----------------+------+-----------+
10 rows in set (0.00 sec)

mysql> -- INNER JOIN --->

mysql> SELECT STUDENT.SID, STUDENT.FIRST_NAME, STUDENT.LAST_NAME, ENROLLMENT.ENROLLMENT_ID, ENROLLMENT.COURSE_ID FROM STUDENT INNER JOIN ENROLLMENT ON STUDENT.SID = ENROLLMENT.SID;
+------+------------+-----------+---------------+-----------+
| SID  | FIRST_NAME | LAST_NAME | ENROLLMENT_ID | COURSE_ID |
+------+------------+-----------+---------------+-----------+
| S001 | aditya     | birla     |             1 | C101      |
| S002 | pari       | Verma     |             2 | C102      |
| S003 | aahan      | rao       |             3 | C101      |
| S004 | karan      | singh     |             4 | C103      |
| S005 | aditi      | Kapoor    |             5 | C104      |
| S006 | priyanka   | Deshmukh  |             6 | C101      |
| S007 | vishwa     | patil     |             7 | C102      |
| S008 | sanika     | chouhan   |             8 | C104      |
| S009 | pallavi    | mishra    |             9 | C103      |
| S010 | yash       | verma     |            10 | C101      |
+------+------------+-----------+---------------+-----------+
10 rows in set (0.01 sec)
mysql> -- LEFT JOIN --->
mysql> SELECT STUDENT.SID, STUDENT.FIRST_NAME, STUDENT.LAST_NAME, ENROLLMENT.ENROLLMENT_ID, ENROLLMENT.COURSE_ID FROM STUDENT LEFT JOIN ENROLLMENT ON STUDENT.SID = ENROLLMENT.SID;
+------+------------+-----------+---------------+-----------+
| SID  | FIRST_NAME | LAST_NAME | ENROLLMENT_ID | COURSE_ID |
+------+------------+-----------+---------------+-----------+
| S001 | aditya     | birla     |             1 | C101      |
| S002 | pari       | Verma     |             2 | C102      |
| S003 | aahan      | rao       |             3 | C101      |
| S004 | karan      | singh     |             4 | C103      |
| S005 | aditi      | Kapoor    |             5 | C104      |
| S006 | priyanka   | Deshmukh  |             6 | C101      |
| S007 | vishwa     | patil     |             7 | C102      |
| S008 | sanika     | chouhan   |             8 | C104      |
| S009 | pallavi    | mishra    |             9 | C103      |
| S010 | yash       | verma     |            10 | C101      |
+------+------------+-----------+---------------+-----------+
10 rows in set (0.01 sec)
mysql> -- RIGHT JOIN --->
mysql> SELECT STUDENT.SID, STUDENT.FIRST_NAME, STUDENT.LAST_NAME, ENROLLMENT.ENROLLMENT_ID, ENROLLMENT.COURSE_ID FROM STUDENT RIGHT JOIN ENROLLMENT ON STUDENT.SID = ENROLLMENT.SID;
+------+------------+-----------+---------------+-----------+
| SID  | FIRST_NAME | LAST_NAME | ENROLLMENT_ID | COURSE_ID |
+------+------------+-----------+---------------+-----------+
| S001 | aditya     | birla     |             1 | C101      |
| S002 | pari       | Verma     |             2 | C102      |
| S003 | aahan      | rao       |             3 | C101      |
| S004 | karan      | singh     |             4 | C103      |
| S005 | aditi      | Kapoor    |             5 | C104      |
| S006 | priyanka   | Deshmukh  |             6 | C101      |
| S007 | vishwa     | patil     |             7 | C102      |
| S008 | sanika     | chouhan   |             8 | C104      |
| S009 | pallavi    | mishra    |             9 | C103      |
| S010 | yash       | verma     |            10 | C101      |
+------+------------+-----------+---------------+-----------+
10 rows in set (0.00 sec)
mysql> -- CROSS JOIN --->
mysql> SELECT STUDENT.SID, STUDENT.FIRST_NAME, STUDENT.LAST_NAME, ENROLLMENT.ENROLLMENT_ID, ENROLLMENT.COURSE_ID FROM STUDENT CROSS JOIN ENROLLMENT;
+------+------------+-----------+---------------+-----------+
| SID  | FIRST_NAME | LAST_NAME | ENROLLMENT_ID | COURSE_ID |
+------+------------+-----------+---------------+-----------+
| S010 | Priya      | Mishra    |             1 | C101      |
| S009 | Karan      | Singh     |             1 | C101      |
| S008 | Anaya      | Kulkarni  |             1 | C101      |
| S007 | Yash       | Joshi     |             1 | C101      |
| S006 | Mira       | Deshmukh  |             1 | C101      |
| S005 | Vihaan     | Kapoor    |             1 | C101      |
| S004 | Sneha      | Rao       |             1 | C101      |
| S003 | Rohan      | Patil     |             1 | C101      |
| S002 | Isha       | Verma     |             1 | C101      |
| S001 | Aarav      | Sharma    |             1 | C101      |
| S010 | Priya      | Mishra    |             2 | C102      |
| S009 | Karan      | Singh     |             2 | C102      |
| S008 | Anaya      | Kulkarni  |             2 | C102      |
| S007 | Yash       | Joshi     |             2 | C102      |
| S006 | Mira       | Deshmukh  |             2 | C102      |
| S005 | Vihaan     | Kapoor    |             2 | C102      |
| S004 | Sneha      | Rao       |             2 | C102      |
| S003 | Rohan      | Patil     |             2 | C102      |
| S002 | Isha       | Verma     |             2 | C102      |
| S001 | Aarav      | Sharma    |             2 | C102      |
| S010 | Priya      | Mishra    |             3 | C101      |
| S009 | Karan      | Singh     |             3 | C101      |
| S008 | Anaya      | Kulkarni  |             3 | C101      |
| S007 | Yash       | Joshi     |             3 | C101      |
| S006 | Mira       | Deshmukh  |             3 | C101      |
| S005 | Vihaan     | Kapoor    |             3 | C101      |
| S004 | Sneha      | Rao       |             3 | C101      |
| S003 | Rohan      | Patil     |             3 | C101      |
| S002 | Isha       | Verma     |             3 | C101      |
| S001 | Aarav      | Sharma    |             3 | C101      |
| S010 | Priya      | Mishra    |             4 | C103      |
| S009 | Karan      | Singh     |             4 | C103      |
| S008 | Anaya      | Kulkarni  |             4 | C103      |
| S007 | Yash       | Joshi     |             4 | C103      |
| S006 | Mira       | Deshmukh  |             4 | C103      |
| S005 | Vihaan     | Kapoor    |             4 | C103      |
| S004 | Sneha      | Rao       |             4 | C103      |
| S003 | Rohan      | Patil     |             4 | C103      |
| S002 | Isha       | Verma     |             4 | C103      |
| S001 | Aarav      | Sharma    |             4 | C103      |
| S010 | Priya      | Mishra    |             5 | C104      |
| S009 | Karan      | Singh     |             5 | C104      |
| S008 | Anaya      | Kulkarni  |             5 | C104      |
| S007 | Yash       | Joshi     |             5 | C104      |
| S006 | Mira       | Deshmukh  |             5 | C104      |
| S005 | Vihaan     | Kapoor    |             5 | C104      |
| S004 | Sneha      | Rao       |             5 | C104      |
| S003 | Rohan      | Patil     |             5 | C104      |
| S002 | Isha       | Verma     |             5 | C104      |
| S001 | Aarav      | Sharma    |             5 | C104      |
| S010 | Priya      | Mishra    |             6 | C101      |
| S009 | Karan      | Singh     |             6 | C101      |
| S008 | Anaya      | Kulkarni  |             6 | C101      |
| S007 | Yash       | Joshi     |             6 | C101      |
| S006 | Mira       | Deshmukh  |             6 | C101      |
| S005 | Vihaan     | Kapoor    |             6 | C101      |
| S004 | Sneha      | Rao       |             6 | C101      |
| S003 | Rohan      | Patil     |             6 | C101      |
| S002 | Isha       | Verma     |             6 | C101      |
| S001 | Aarav      | Sharma    |             6 | C101      |
| S010 | Priya      | Mishra    |             7 | C102      |
| S009 | Karan      | Singh     |             7 | C102      |
| S008 | Anaya      | Kulkarni  |             7 | C102      |
| S007 | Yash       | Joshi     |             7 | C102      |
| S006 | Mira       | Deshmukh  |             7 | C102      |
| S005 | Vihaan     | Kapoor    |             7 | C102      |
| S004 | Sneha      | Rao       |             7 | C102      |
| S003 | Rohan      | Patil     |             7 | C102      |
| S002 | Isha       | Verma     |             7 | C102      |
| S001 | Aarav      | Sharma    |             7 | C102      |
| S010 | Priya      | Mishra    |             8 | C104      |
| S009 | Karan      | Singh     |             8 | C104      |
| S008 | Anaya      | Kulkarni  |             8 | C104      |
| S007 | Yash       | Joshi     |             8 | C104      |
| S006 | Mira       | Deshmukh  |             8 | C104      |
| S005 | Vihaan     | Kapoor    |             8 | C104      |
| S004 | Sneha      | Rao       |             8 | C104      |
| S003 | Rohan      | Patil     |             8 | C104      |
| S002 | Isha       | Verma     |             8 | C104      |
| S001 | Aarav      | Sharma    |             8 | C104      |
| S010 | Priya      | Mishra    |             9 | C103      |
| S009 | Karan      | Singh     |             9 | C103      |
| S008 | Anaya      | Kulkarni  |             9 | C103      |
| S007 | Yash       | Joshi     |             9 | C103      |
| S006 | Mira       | Deshmukh  |             9 | C103      |
| S005 | Vihaan     | Kapoor    |             9 | C103      |
| S004 | Sneha      | Rao       |             9 | C103      |
| S003 | Rohan      | Patil     |             9 | C103      |
| S002 | Isha       | Verma     |             9 | C103      |
| S001 | Aarav      | Sharma    |             9 | C103      |
| S010 | Priya      | Mishra    |            10 | C101      |
| S009 | Karan      | Singh     |            10 | C101      |
| S008 | Anaya      | Kulkarni  |            10 | C101      |
| S007 | Yash       | Joshi     |            10 | C101      |
| S006 | Mira       | Deshmukh  |            10 | C101      |
| S005 | Vihaan     | Kapoor    |            10 | C101      |
| S004 | Sneha      | Rao       |            10 | C101      |
| S003 | Rohan      | Patil     |            10 | C101      |
| S002 | Isha       | Verma     |            10 | C101      |
| S001 | Aarav      | Sharma    |            10 | C101      |
+------+------------+-----------+---------------+-----------+
100 rows in set (0.01 sec)


