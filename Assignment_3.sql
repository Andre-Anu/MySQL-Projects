/*
				Assignment 3
                  Worth 4%
                Total Assignment is out of 50 marks  
				Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements                
                Make sure you run the CreateDB Script to create the sample database 
                You will need it to create the queries based on these tables
*/

USE SAMPLE;
/* Question 1: Write a statement to SELECT all of the columns in the DEPARTMENT table  ( 5 marks )*/
SELECT * FROM DEPARTMENT;

/* Question 2: Write a statement to SELECT all of the columns in the EMPLOYEE table but only return 5 rows   ( 5 marks )*/
SELECT * FROM EMPLOYEE LIMIT 5;

/* Question 3: Write a statement to SELECT all of the columns from the PROJECT table where there is more than 3 PRSTAFF  ( 5 marks )*/
SELECT * FROM PROJECT WHERE PRSTAFF > 3;

/* Question 4: Write a statement to SELECT PROJNO and RESPEMP AND the date fields from the PROJECT table where the project was still running on July 1 2002 (5 marks)*/
SELECT PROJNO, RESPEMP, PRSTDATE, PRENDATE FROM PROJECT WHERE PRENDATE > '2002-07-01' OR PRENDATE IS NULL;

/* Question 5: Write a statement to SELECT PROJNO, PROJNAME AND DEPTNO from the PROJECT table where PROJNAME has the word PROGRAMMING in it ( 5 marks )*/
SELECT PROJNO, PROJNAME, DEPTNO FROM PROJECT WHERE PROJNAME LIKE '%PROGRAMMING%';

/* Question 6: Write a statement to SELECT from the PROJECT table where MAJPROJ starts with AD and has 4 wildcard place holders (5 marks)*/
SELECT * FROM PROJECT WHERE MAJPROJ LIKE 'AD____';

/* Question 7: Write a statement to SELECT from the EMPLOYEE table where that returns all the records where the JOB name is 5 characters long (make sure to remove any spaces) (5 marks)*/
 SELECT * FROM EMPLOYEE WHERE LENGTH(TRIM(JOB)) = 5;
 
/* Question 8: Write a statement to SELECT the EMPNO and put the FIRSTNME AND the LASTNAME column together with a space in between and call it FULLNAME from the EMPLOYEE table as columns (5 marks)*/
SELECT EMPNO, CONCAT(FIRSTNME,' ',LASTNAME) AS FULLNAME FROM EMPLOYEE;

/* Question 10: Write a statement to SELECT the EMPNO and the YEAR out of the HIRE DATE and the MONTH of out of the birthdate from the EMPLOYEE table as columns  ( 5 marks ) (HINT date functions)*/
SELECT EMPNO, YEAR(HIREDATE), MONTH(BIRTHDATE) FROM EMPLOYEE;
