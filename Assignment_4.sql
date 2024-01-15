/*
				Assignment 4
                  Worth 5%
                Total Assignment is out of 50 marks  
				Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements
                Make sure you run the CreateDB Script to create the sample database
                You will need it to create the queries based on these tables
*/

USE SAMPLE;
/* Question 1: Write an UPDATE statement to change all of the LASTNAMEs in the EMPLOYEE table to SMITH (5 marks)*/
UPDATE EMPLOYEE SET LASTNAME = 'SMITH';

/* Question 2: Write an UPDATE statement to change all of the MAJPROJ records in the PROJECT to AD9999 Where they don't have a value(5 marks)*/
SELECT * FROM PROJECT;
UPDATE PROJECT SET MAJPROJ = 'AD9999' WHERE MAJPROJ = '';
/* Question 3: Write a single UPDATE statement to change the WorkDept to 'CPP' and the JOB to Instructor WHERE the EMPNO is 000010*/
SELECT * FROM EMPLOYEE WHERE EMPNO = '000010';
UPDATE EMPLOYEE SET WORKDEPT = 'CPP', JOB = 'Instructor' WHERE EMPNO = '000010';

/* Question 4: Write an UPDATE statement to change the SALARY to be increased by 10% WHERE EMPLOYEE IS older than 40 years old(10 marks) (hint date functions to determine age)*/
SELECT * FROM EMPLOYEE WHERE BIRTHDATE < '1983-10-06';
UPDATE EMPLOYEE SET SALARY = SALARY * 1.1 WHERE BIRTHDATE < '1983-10-06';

/* Question 5: Write a DELETE statement to remove employee 000030 from the EMPLOYEE table (5 marks)*/
SELECT * FROM EMPLOYEE;
DELETE FROM EMPLOYEE WHERE EMPNO = '000030';

/* Question 6: Write a DELETE statement to remove records where the total of their SALARY and COMM column together is less than $40000 and they have worked for the company for less than 8 years from the Employee table (7 marks)*/
SELECT * FROM EMPLOYEE WHERE SALARY + COMM < 40000 AND HIREDATE > '2015-10-06';
DELETE FROM EMPLOYEE WHERE SALARY + COMM < 40000 AND HIREDATE > '2015-10-06';

/* Question 7: Write a DELETE statement to remove records WHERE the project name has OPERATION in the name from the project table (10 marks)*/
SELECT * FROM PROJECT WHERE PROJNAME LIKE '%OPERATION%';
DELETE FROM PROJECT WHERE PROJNAME LIKE '%OPERATION%';
