/*
				Assignment 2 
                  Worth 3%
                Total Assignment is out of 55 marks  
				Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements

*/


/*  NOTE   Please read all the questions before creating your table in question 1 as your table and data need to be good enough 
quality to satisfy the conditions for Question 3 - 6 */

 CREATE DATABASE ASSIGNMENT2;
 USE ASSIGNMENT2;
 DROP DATABASE IF EXISTS ASSIGNMENT2;
 
 /*
Question 1

Write 2 statements to Create two tables that have a way to force uniqueness from row to row and are related 
by one of their columns ( make sure you have a least 1 date column )   ( 10 marks )

create employee table with empid int(10) primary key auto_increment, empname varchar(30) not null, 
gender char(1) not null, dob date not null, dept varchar(15) not null
and 
table salary with columns empid int, salary int(10) not null, 
branch varchar(20) not null, FOREIGN KEY (empid) REFERENCES employee(empid));
 */
 
 CREATE TABLE employee (
    empid INT(10) PRIMARY KEY AUTO_INCREMENT,
    empname VARCHAR(30) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    dept VARCHAR(15) NOT NULL
);

CREATE TABLE salary (
    empid INT,
    salary INT(10) NOT NULL,
    branch VARCHAR(20) NOT NULL,
    FOREIGN KEY (empid) REFERENCES employee(empid)
);
 
 /*
 Question 2
/////// NOTE rember the order of which table you insert into first is important
 
 Write 5 statements to add to the source table you created in question 1  (5 marks)
 
 Write 5 statements to add to the dependant table you created in question 1  (5 marks)
  
 */
 
 INSERT INTO employee (empname, gender, dob, dept) VALUES
    ('Andre Martins', 'M', '1994-10-27', 'Manegment'),
    ('May Hirata', 'F', '1985-03-20', 'Accounts'),
    ('Hidetoshi Okada', 'M', '1992-09-10', 'IT'),
    ('Fang-Ting Hsu', 'F', '1988-12-03', 'Marketing'),
    ('Juan Montana', 'M', '1995-07-25', 'HR');

INSERT INTO salary (empid, salary, branch) VALUES
    (1, 80000, 'A'),
    (2, 90000, 'B'),
    (3, 74000, 'C'),
    (4, 85000, 'A'),
    (5, 72000, 'B');
 
-- Question 3: show the structure of the created table. (5 marks)
 
DESCRIBE employee;
DESCRIBE salary;
 
-- Question 4: Display all Records of both tables. (5 marks)
 
SELECT * FROM employee;
SELECT * FROM salary;
 
-- Question 5: Display all emplyees' name and dob in descending order by name. (5 marks)
 
SELECT empname, dob FROM employee ORDER BY empname DESC;

-- Question 6: Display employee id whose salary less than 75000. (5 marks)

SELECT empid FROM salary WHERE salary < 75000;

-- Question 7: Display employee name who work in Accounts and Management department using IN operator. (5 marks)
 
SELECT empname FROM employee WHERE dept IN ('Accounts', 'Manegment');
 
-- Question 8: Display employee name whose name start with 'M'. (5 marks)

SELECT empname FROM employee WHERE empname LIKE 'M%';

-- Question 9: Display employee name whose name start with "A" and are at least 3 characters in length. (5 marks)
  
SELECT empname FROM employee WHERE empname LIKE 'A__%';