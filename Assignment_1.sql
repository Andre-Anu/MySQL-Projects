/*
				Assignment 1 
                  Worth 3%
                Total Assignment is out of 75 marks  
		Complete all of the questions in this SQL file and submit the file for grading
                Open this file in SQL Workbench to complete all of the statements
*/





/*
 Question 1
 
 Write a statement to Create a database (make sure your database doesn't contain special characters)  ( 5 marks )
*/
# Put your answer here

CREATE DATABASE MONKE_GAME;

/*
 Question 2
 
 Write a statement to Drop that Database you created in Question 1  ( 5 marks )
 
*/

DROP DATABASE MONKE_GAME;

/*
 Question 3
 
 Write a statement to set the database you created to be the one that will be active for your session  ( 5 marks )
 
*/

USE MONKE_GAME;

/*
 Question 4
 
 Write a statement to Create a table that will have columns that represent all of the basic datatypes that are available in the 
 databse  (make sure your table and column names are describe the content of the table)  ( 15 marks )
 example
 CREATE TABLE book_info (
     id                 VARCHAR(32)     not null,
     filePath           long varchar     null,
     price		        float     null ,
     title                  null,
     author             long varchar     null,
  );
 
*/

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(255) NOT NULL,
    LVL INT,
    Experience BIGINT,
    IsOnline BOOLEAN
);

/*
 Question 5
 
 Write 5 statements to add data to the table you created in question 4   ( 15 marks )
   
 */

INSERT INTO Players (PlayerID, PlayerName, LVL, Experience, IsOnline)
VALUES
    (1, 'Hero123', 10, 5000, true),
    (2, 'MageMaster', 15, 8500, true),
    (3, 'StealthyNinja', 8, 3500, false),
    (4, 'DragonSlayer', 20, 15000, true),
    (5, 'EpicGamerEve', 12, 7000, true);

/*
 Question 6
 
 Write 2 statements to Create two tables that have a way to force uniqueness from row to row 
 ( make sure your table and column names are describe the content of the table)   ( 10 marks )
  
 */

CREATE TABLE Items (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(255) UNIQUE,
    ItemType VARCHAR(50),
    Description TEXT
);

CREATE TABLE Monsters (
    MonsterID INT PRIMARY KEY,
    MonsterName VARCHAR(255) NOT NULL,
    MonsterType VARCHAR(50),
    UNIQUE (MonsterName, MonsterType)
);

/*
 Question 7
 
 Write 5 statements to add to the first table you created in question 6   ( 10 marks )
 
 Write 5 statements to add to the second table you created in question 6  ( 10 marks )
  
 */

INSERT INTO Items (ItemID, ItemName, ItemType, Description)
VALUES
    (1, 'Sword of Flames', 'Weapon', 'A sword that burns with magical flames.'),
    (2, 'Scroll of Wisdom', 'Item', 'A mysterious scroll containing ancient knowledge.'),
    (3, 'Health Potion', 'Consumable', 'Restores health points when consumed.'),
    (4, 'Dragon Scale Armor', 'Armor', 'Armor made from the scales of a dragon.'),
    (5, 'Invisibility Cloak', 'Cloak', 'Grants the wearer temporary invisibility.');

INSERT INTO Monsters (MonsterID, MonsterName, MonsterType)
VALUES
    (1, 'Fire Elemental', 'Elemental'),
    (2, 'Goblin King', 'Goblin'),
    (3, 'Ice Dragon', 'Dragon'),
    (4, 'Shadow Assassin', 'Assassin'),
    (5, 'Orc Warlord', 'Orc');