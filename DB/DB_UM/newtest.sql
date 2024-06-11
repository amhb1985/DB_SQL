
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

-- whats diffrent between =>  AND ->
--the first commend is like to ready but for the 2nd that maens that its not end and for END of Query
-- we need ;

-- COPY 
-- we can see that with the \copy that means copy the file
\copy track_raw(title,artist,album,count,rating,len) FROM 'library.csv' WITH DELIMITER ',' CSV;

-- SELECT *
-- we can see all of the trac_row table
select * from track_raw;

-- SELCT COUNT(*)
--we can see the count of all from the table
select count (*) from track_raw;

-- SELECT one exact title from Table 
SELECT title, album FROM track_raw ORDER BY title LIMIT 3;

-- so for the next step we ttry to the test and learn with Track_row.csv data that we added before:

-- so now we wanna create a new table from our source as Track_raw 
-- so then we need some palan for our table (here as track_row)
--1. Track
--2. Titile
--3. Ganre
--4. Number_place
--5. Rating


-- and  now we are going to another important Thema
--KEY
-- we have 3 kinde of KEY:

--1. Primery key
--2. Logical key
--3. Foreign key


-- the most important Key is the Primary key bcos we have just one for any table
-- we have lot of convantion that define some standrad for the PK (primary key)
-- but generral  id is our primary key
/*
-- every PK has Rules:
. Never use your logical key as the primary key.
• Logical keys can and do change, albeit slowly.
• Relationships that are based on matching string fields are less efficient than integers.
*/

/*

-- Foreign Key

-- DATABASE Normalization (3NF)

There is *tons* of database theory - way too much to understand without excessive predicate calculus
• Do not replicate data. Instead, reference data. Point at data.
• Use integers for keys and for references.
• Add a special "key" column to each table, which you will make references to.
*/
--Integer Reference Pattern:
--we use this query for the select from id as PK: in music=> 
SELECT * FROM artist;

-- and for select FK we use this query to join in it:
SELECT * FROM album;


--Creating our Music Database sudo -u postgres psql postgres
-- first we commend to psql that we want a super user. sudo -u
sudo -u postgres psql postgres

-- I. Create DB
-- next we create DB wth >> NAME , >> WITH OWNER  and >> ENCODING:
--postgres=#  we r now in postgres!
CREATE DATABASE music
WITH OWNER 'pg4e' ENCODING 'UTF8';
CREATE DATABASE

--II. Create Tables
-- we r creating now 4 diffrent Tables as artist and album:
-- notice that Logically Key is UNIQUE
--1. artist: 
CREATE TABLE artist (
    id SERIAL,
    name VARCHAR (128) UNIQUE,
    PRIMARY KEY (id)
);

--2. album:
CREATE TABLE album (
    id SERIAL,  
    title VARCHAR (128) UNIQUR,
    artist id INTEGER REFERENCES artist(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

--3. genre:
CREATE TABLE genre (
    id SERIAL,
    name VARCHAR (128) UNIQUE,
    PRIMARY KEY (id)
) ;

--4. Track:
CREATE TABLE track (
    id SERIAL, 
    title VARCHAR (128) , 
    len INTEGER, rating INTEGER, 
    count INTEGER,
    album_id INTEGER REFERENCES album(id) ON DELETE CASCADE, 
    genre_id INTEGER REFERENCES genre (id) ON DELETE CASCADE, 
    UNIQUE (title, album_id),
    PRIMARY KEY (id)
);

-- III. after that create Table 
-- now we are going to insert data in our Tables
-- we must notice taht befor that insert q we must first join in our DATABASE!
-- probably: cd music we can see the directoy of our DB music=> 

-- ALBUM TABLE
INSERT INTO artist (name) VALUES ('Led Zeppelin');
INSERI INTO artist (name) VALUES ('AC/DC');

-- after tahat we try to see the result with q:
SELECT * FROM artist;

-- ARTIST TABLE
-- and then we r countinue with INSERT to the album Table:
INSERT INTO album (title, artist_id) VALUES ('Who Made who', 2);
INSERI INTO album (title, artist_id) VALUES ('IV', 1);

SELECT * FROM album;

-- GENRE TABLE
INSERT INTO genre (name) VALUES ('Rock');
INSERI INTO genre (name) VALUES ( 'Metal');

SELECT * FROM genre;

-- TRACK TABLE 
INSERT INTO track (title, rating, len, count, album_id, genre_id)
VALUES ( 'Black Dog', 5, 297, 0, 2, 1) ;

INSERT INTO track (title, rating, len, count, album_.
_id, genre_ id)
VALUES ('Stairway', 5, 482, 0, 2, 1) ;

INSERT INTO track (title, rating, len, count, album_id, genre_id)
VALUES ('About to Rock', 5, 313, 0, 1, 2); 

INSERT INTO track (title, rating, len, count, album_id, genre_id)
VALUES ( 'Who Made Who', 5, 207, 0, 1, 2) ;

SELECT * FROM track;


-- Getting JOIN between tables in one DB:
/*
Relational Power
• By removing the replicated data and replacing it with references to 
a single copy of each bit of data, we build a "web" of information that the relational database
 can read through very quickly - even for very large amounts of data.
• Often when you want some data it comes from a number of tables linked by these foreign keys.
*/















