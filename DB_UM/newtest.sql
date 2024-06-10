
-- this is about test sql learning in the DB --
--  i wanna test and try to reapeat some squery in the sql 

-- this test and text is under the learning Progrom with 
--Dr Chuck (Dr. Charles Russell Severance)in the Coursera learning platform

-- ## COMMENT ## 
-- 1. the  first is about comment with - - we can just in 1 line 
/* 2. we can in 2ways comments >> 
with this we can cotinue next lines till
*/

-- Connect
/* the first we must connet to our/one Database DB 
We can under lots of progroms /terminal  for example:

Internet:
# 1. Anaconda (python anywhere website under)
https://www.pythonanywhere.com

Terminal : 
# 1, Mac  psql (SQL Shell)
# 2, Linux bash 

Programm:
# 1, PG Admin
# 2, DB eaver
# 3, SQLdeveloper
*/

-- ## TERMINAL commend ##
--pwd 
--  in just bashin Linux show where we are



-- 2nd week DB UM
-- ## workin with Tables and SQL

-- INSERT:
-- statement inserr  ROW  in to a Table
INSERT INTO users (name, email) VALUES ('chuck', csev@umich.edu); 

--DELET:
-- delete a row in a table 
DELETE INTO users (name, email) VALUES ('chuck', csev@umich.edu); 
-- NOTICE : without after users the row info >> delete all rows from users

--UPDATE
-- Allow the update pf the Field with  WHERE  clause
UPDATE users SET name='charles' WHERE email='csev@umich.edu' ;
-- NOT: for the every row that where is same , one or hunderd of them

-- SELECT
-- Rtrives a group of records 
SELCT * FROM users WHERE email='csev@umich.edu' ;

--the same rulls like another >>> withot where select all 

--ORDER BY
SELECT * FROM user ORDER BY email; 

--LIKE
SELECT * FROM user WHRER name LIKE '%g%' ; 

--LIMIT/ OFFSET 
--the both of the order *before* / offset : start from 0
SELECT * FROM users ORDER BY email DESK LIMIT 2;
SELECT * FROM users ORDER BY email OFFSET 1 LIMIT 2;

--COUNT 
SELECT COUNT(*) FROM users;
--or
SELECT COUNT(*) FROM users WHERE email='csev@umich.edu';

-- the next Thema is. AUTO_INCREMENT
--DELETE and drop one Table 
 DROP TABLE users;
 --CREATE one Table with the PRIMERY_KEY 
CREATE TABLE users (
id SERIAL, name VARCHAR (128),
email VARCHAR (128) UNIQUE,
PRIMARY KEY (id) ;


-- now speaking about INDEX in SQL

-- the test about vreate table 
--
/*
In this assignment you will create a table, and the autograder will insert a few rows to test your schema.

 Create a table named automagic with the following fields: 

An id field that is an auto-incrementing serial field. 
A name field that allows up to 32 characters but no more. This field is required. 
A height field that is a floating point number that is required. 
*/

CREATE TABLE automagic (
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    height FLOAT NOT NULL
);

-- and now about another query 
-- its about reading one file >> vl
vi library.csv


-- with this one we can qexit from reading form :q
:q





























