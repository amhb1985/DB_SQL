
#so i wannaa revwie again
#first we must set some settinig in SQLAlchemy like: engine, FK, colums 
from sqlalchemy import create_engine, ForeignKey, Column, String, Integer, CHAR

#2: This Module allows us as Dev. to define database models
# in a more concise and declarative way using Python classes
from sqlalchemy.ext.declarative import declarative_base


# 3: In SQLAlchemy, the sessionmaker class is a factory for producing 
# new Session objects. Sessions are used to interact with the database &
# perform operations such as adding, updating, deleting, and querying data.
from sqlalchemy.orm import sessionmaker


#4:to create a base class for declarative class definitions.
# This statement is typically found at the beginning of SQLAlchemy model definitions.
Base = declarative_base()

#5. we will define a new Class as Person :
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

engine = create_engine ("psql=:///mydb.db , echo=True")
## das ist aber Hilfe von GPT für den Pfad inner mac und in der psql (postgres sql DB)
## engine = create_engine ("postgresql://username:password@localhost:5432/mydb") 
Base.metadata.create_all(bind = engine)
Session = sessionmaker(bind= engine)
session = Session()

person=  Person(12312, "Mike", "Smith", "m", 35)

Session.add(person)
session.commit()

p1 = Person(31234, "Ana", "Green", "f", 40)
p2 = Person(22356, "Bob", "Blue", "m", 45)
p3 = Person(12984, "Angela", "Cold", "f", 22)

session.add(p1)
session.add(p2)
session.add(p1)

session.commit()




        



    
