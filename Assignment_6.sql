/*
				Assignment 6
                  Worth 10%
                Total Assignment is out of 70 marks  
				
                Complete all of the questions in this SQL file and submit the file for grading
                
                Open this file in SQL Workbench to complete all of the statements
                
                Make sure you run the CreateDB Script to create the sample database again so you have the correct data 
				
                You will need it to create the queries based on these tables
                
                There is a .jpg file which shows the tables in the database
*/

/*
 Question 1 (10 marks)
 
 a) Create two tables with the same numbers of columns and datatypes (mininum 3 columns in each table) (3 marks)
 
 b) Populate that table with data (3 marks)
 
 c) Create a SELECT statement for each table and UNION them together (4 marks)
*/
CREATE TABLE PirateCrew (
    PirateID INT,
    PirateName VARCHAR(50),
    Booty DECIMAL(9,2)
);

CREATE TABLE PirateShipmates (
    PirateID INT,
    PirateName VARCHAR(50),
    Booty DECIMAL(9,2)
);

INSERT INTO PirateCrew VALUES (1, 'Blackbeard', 50000.00);
INSERT INTO PirateCrew VALUES (2, 'Red Anne', 60000.00);
INSERT INTO PirateCrew VALUES (3, 'Calico Jack', 75000.00);

INSERT INTO PirateShipmates VALUES (4, 'Dread Pirate Roberts', 55000.00);
INSERT INTO PirateShipmates VALUES (5, 'Captain Kidd', 70000.00);
INSERT INTO PirateShipmates VALUES (6, 'Anne Bonny', 80000.00);

SELECT * FROM PirateCrew;

SELECT * FROM PirateShipmates;

SELECT * FROM PirateCrew UNION SELECT * FROM PirateShipmates;

/*
 Question 2 (10 marks)
 
 Create a query that lists the department number, employee number, and salaries of all employees in department D11.  
 UNION the same information, but this time sum up all the salaries to create a one line summary entry for the D11 department (hint sum the salary). 
 Sort the list by Salary.
*/
SELECT WORKDEPT AS DEPTNO, EMPNO, SALARY
FROM EMPLOYEE
WHERE WORKDEPT = 'D11'
UNION
SELECT 'D11' AS DEPTNO, 'Total' AS EMPNO, SUM(SALARY) AS SALARY
FROM EMPLOYEE
WHERE WORKDEPT = 'D11'
ORDER BY SALARY;

/*
 Question 3 (10 marks)
 
a) Write a query that uses NATURAL JOIN TO connect the EMPLOYEE and EMPPROJACT table.   
Include the Employee number, First and Last name, Salary, Salary increased by 3% and Project number( 3 marks )
 
b) Use INNER JOIN OR JOIN with the same query with USING statement( 3 marks )

c) Use INNER JOIN OR JOIN with the same query with joined columns (hint a = a )    ( 4 marks )
*/
SELECT EMPNO, CONCAT(FIRSTNME, ' ', LASTNAME) AS FULLNAME, SALARY, SALARY * 1.03 AS INCREASED_SALARY, PROJECT.PROJNO AS PROJ_NUM
FROM EMPLOYEE
NATURAL JOIN PROJECT;

SELECT *
FROM PROJECT
INNER JOIN DEPARTMENT
USING (DEPTNO);

SELECT EMPNO, CONCAT(FIRSTNME, ' ', LASTNAME) AS FULLNAME, SALARY, SALARY * 1.03 AS INCREASED_SALARY, PROJECT.PROJNO AS PROJ_NUM
FROM EMPLOYEE
INNER JOIN PROJECT
ON EMPLOYEE.WORKDEPT = PROJECT.DEPTNO;

/*
Question 4 (10 marks)
 
Write a query that uses INNER JOIN TO connect the EMPLOYEE, PROJECT tables.   
Include the Project number, Department number, Project start and end date   
WHERE They belong to department D11 , Salary is more than or equal to 65 percent of $15,000 AND Salary is less than or equal to 130 percent of $40,000 
*/
SELECT PROJECT.PROJNO, PROJECT.DEPTNO, PROJECT.PRSTDATE, PROJECT.PRENDATE
FROM EMPLOYEE
INNER JOIN PROJECT
ON EMPLOYEE.WORKDEPT = PROJECT.DEPTNO
WHERE EMPLOYEE.WORKDEPT = 'D11'
AND EMPLOYEE.SALARY >= 0.65 * 15000
AND EMPLOYEE.SALARY <= 1.3 * 40000;

/*
 Question 5 (10 marks)
 
 Create a query that display departname of the employee who
 has highest salary. 
*/
SELECT DEPARTMENT.DEPTNAME
FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.WORKDEPT = DEPARTMENT.DEPTNO
ORDER BY SALARY DESC
LIMIT 1;

/*
 Question 6 (20 marks)
 
  Describe all of the relationships between the tables in the attached image file TableRelationships.jpg
  
  a) describe all the foreign key and primary keys, either by detailing them 1 by 1 or define the CREATE table statements for all the tables (10 marks)
  b) describe the relationship between each table ( 1..1 (exactly one match)  1..n (one or more matches)) (5 marks)
 */
CREATE TABLE PERSON(
  ID INT(11) PRIMARY KEY,
  FIRSTNAME VARCHAR(255),
  LASTNAME VARCHAR(255),
  DOB DATE,
  MANAGERID INT(11),
  NOTES TEXT,
  CREATED TIMESTAMP,
  FOREIGN KEY (MANAGERID) REFERENCES PERSON(ID)
);

CREATE TABLE PROJECTPERSON(
  PRID INT(11) PRIMARY KEY,
  PID INT(11) PRIMARY KEY,
  RID INT(11) PRIMARY KEY,
  FOREIGN KEY (PRID) REFERENCES PROJECT(ID),
  FOREIGN KEY (PID) REFERENCES PERSON(ID),
  FOREIGN KEY (RID) REFERENCES ROLE(ID)
);

CREATE TABLE ROLE(
  ID INT(11) PRIMARY KEY,
  LABEL VARCHAR(255)
);

CREATE TABLE PROJECT(
  ID INT(11) PRIMARY KEY,
  LABEL VARCHAR(255),
  BUDGET DOUBLE
);

CREATE TABLE CONTACT(
  PID INT(11) PRIMARY KEY,
  CTID INT(11) PRIMARY KEY,
  VALUE TEXT,
  FOREIGN KEY (CTID) REFERENCES CONTACTTYPE(ID),
  FOREIGN KEY (PID) REFERENCES PERSON(ID)
);

CREATE TABLE CONTACTTYPE(
  ID INT(11) PRIMARY KEY,
  LABEL VARCHAR(255)
);

/*
b)
CONTACTTYPE ONE-TO-ONE CONTACT
PERSON ONE-TO-MANY CONTACT
PERSON  ONE-TO-MANY PROJECTPERSON
ROLE ONE-TO-ONE PROJECTPERSON
PROJECT ONE-TO-ONE PROJECTPERSON
*/