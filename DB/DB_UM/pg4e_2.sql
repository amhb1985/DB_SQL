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

-- now we r going to another thema Dates!
-- we have some kind of diffrent dates type
'''
Date Types (Review)
DATE - 'YYYY-MM-DD'
TIME - 'HH: MM:SS'
TIMESTAMP - 'YYYY-MM-DD HH:MM:SS'
(4713 BC, 294276 AD)
TIMESTAMPTZ - "TIMESTAMP WITH TIME ZONE"
Built-in PostgreSQL function NOW()
'''

-- test update
-- wieder test update


-- Day Type(review)
'''
 - Date
 - Time
 - Timestamp
 - Timstamotz
 - Built in psql >> NOW()


 Setting default values
• We can save some code by auto-populating date fields when a row is INSERTed
• We will auto-set on UPDATEs later...

'''
-- for example:

CREATE TABLE fav (
id SERIAL, oops TEXT, -- Will remove later with ALTER
post_ id INTEGER REFERENCES post (id) ON DELETE CASCADE, account
_id INTEGER REFERENCES account (id) ON DELETE CASCADE,
created
_at TIMESTAMPTZ NOT NULL DEFAULT NOW (),
updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW ( ), UNIQUE (post_ id, account_id), PRIMARY KEY (id)
) i


''' PostgreSQL time zone:
 we can see the all of time zone with this query:
 '''
select * from pg_timezone_names;

 












