/*
				Assignment 7
                  Worth 10%
                Total Assignment is out of 40 marks  
				
                Complete all of the questions in this SQL file and submit the file for grading
                
                Open this file in SQL Workbench to complete all of the statements
                
                Make sure you run the CreateDB Script to create the sample database again so you have the correct data 
				
                You will need it to create the queries based on these tables
                

*/


/*
 Question 1 (5 marks)
 
  Create a query that SELECT all of the EMPLOYEES from the EMPLOYEE TABLE that are Mangers.  
  Include Employee ID first name, Lastname and Salary (Hint: Self Join)
*/
SELECT EMPNO, FIRSTNME, LASTNAME, SALARY
FROM EMPLOYEE
WHERE JOB = 'MANAGER';

SELECT E.EMPNO, E.FIRSTNME, E.LASTNAME, E.SALARY
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.WORKDEPT = D.DEPTNO
WHERE JOB = 'MANAGER';

SELECT E.EMPNO, E.FIRSTNME, E.LASTNAME, E.SALARY
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON E.WORKDEPT = D.DEPTNO AND E.JOB = 'MANAGER';

SELECT E.EMPNO, E.FIRSTNME, E.LASTNAME, E.SALARY
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON E.WORKDEPT = D.DEPTNO
WHERE E.JOB = 'MANAGER';

/*
 Question 2 (5 marks)
 
 Write a query the gives the Employee ID first name, Lastname and Salary and Project Number of EMPLOYEES who aren't currently 
 assigned to a project (hint outer join)
*/
SELECT E.EMPNO, E.FIRSTNME, E.LASTNAME, E.SALARY, P.PROJNO
FROM EMPLOYEE E
LEFT JOIN PROJECT P ON E.EMPNO = P.RESPEMP
WHERE P.PROJNO IS NULL;

/*
 Question 3 (8 marks)
 
Create a query that lists the lastnme, job, the number of years they've worked as of Jan 01/2002 ( hint : year function Jan 01/2002 minus hiredate), and their salary.  
Get the employees that have the same Job  as the employee named starts with J  (hint subquery from employee) and hiredate < Jan 01/2002 
 Sort the listing by highest salary first.  
 
*/
SELECT LASTNAME, JOB, 
YEAR('2002-01-01') - YEAR(HIREDATE) AS YEARS_WORKED, SALARY
FROM EMPLOYEE
WHERE JOB IN (SELECT JOB FROM EMPLOYEE WHERE LASTNAME LIKE 'J%' AND HIREDATE < '2002-01-01')
AND HIREDATE < '2002-01-01'
ORDER BY SALARY DESC;

/*
 Question 5 (12 marks)
 
 Create a table in 1NF (mininum 5 columns the table).  
 Then transform that table into as many tables as necessary to satisfy 2NF.
 Then transform that table into as many tables as necessary to satisfy 3NF

*/
-- 1NF
CREATE TABLE EmployeeTable (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Address VARCHAR(100),
    Position VARCHAR(50),
    Department VARCHAR(50)
);
-- 2NF
CREATE TABLE EmployeeTable (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Address VARCHAR(100),
    Position VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES DepartmentTable(DepartmentID)
);

CREATE TABLE DepartmentTable (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
-- 3NF
CREATE TABLE EmployeeTable (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Address VARCHAR(100),
    Position VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES DepartmentTable(DepartmentID)
);

CREATE TABLE DepartmentTable (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE PositionTable (
    PositionID INT PRIMARY KEY,
    PositionName VARCHAR(50)
);

/*
 Question 6 (10 marks)
 
  Create a View (V_EMP_DEPT_PROJ) statement that joins the EMPLOYEE and PROJECT table (join on PROJNO).  Limit the view to contain :
o	ID
o	Name (FirstName and Lastname)
o	WorkDept
o	Salary
o	PROJNO
o	PROJNAME
o	Where Salary < 100000
 */
CREATE VIEW V_EMP_DEPT_PROJ AS
SELECT E.EMPNO AS ID,
       CONCAT(E.FIRSTNME, ' ', E.LASTNAME) AS Name,
       E.WORKDEPT AS WorkDept,
       E.SALARY,
       P.PROJNO,
       P.PROJNAME
FROM EMPLOYEE E
JOIN PROJECT P ON E.EMPNO = P.RESPEMP
WHERE E.SALARY < 100000;