
from sqlalchemy import create_engine, ForeignKey, Column, String, Integer, CHAR
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

class Person(Base):
    __tablename__ ="people"
    

    ssn = Column("ssn", Integer, primary_key=True )
    firstname = Column("firstname", String)
    lasttname = Column("lasttname", String)
    gender = Column("gender", CHAR)
    age = Column("age", Integer)

    def __init__ (self, ssn, firstname, lastname,gender, age):
        self.ssn = ssn
        self.firstname = firstname
        self.lasttname = lastname
        self.gender = gender
        self.age = age


    def __repr__(self):
        return f"({self.ssn}) {self.firstname} {self.lasttname} {self.lasttname}  ({self.gender},{self.age})"














    