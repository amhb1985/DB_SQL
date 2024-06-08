
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

























