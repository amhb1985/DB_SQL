-- this is the 2nd course of pg4e 

-- this is about CREATE TABLE

/*
 we can adjust our schema

 . Sometimes you make a mistake or your application evolves
 
*/
create table fav (
    id serial.
    oops text,
    post_id integer REFERENCES post(id) on DELETE CASCADE ,
    acount_id INTEGER REFERENCES account (id) ON DELETE CASCADE,
    UNIQUE(post_id,acount_id),
    PRIMARY KEY(id) 
);

ALTER TABLE fav DROP COLUMN oops;


-- Add , Drop , Alter coöumns
ALTER TABLE fav DROP COLUMN oops;
ALTER TABLE post ALTER COLUMN content TYPE TEXT;
ALTER TABLE fav ADD COLUMN howmuch INTEGER;

