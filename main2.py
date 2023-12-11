#this is an Study about the how sqlAlcemy ORM working and  learning how we can
#use python script as sql query 

#the most scriptiny was base on youtuber NeuralNine
# https://www.youtube.com/watch?v=AKQ3XEDI9Mw


from sqlalchemy import create_engine, Column, String, Integer, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

Base = declarative_base()





class Person(Base):
    __tablename__ = "people"
    
    ssn = Column(Integer, primary_key=True)
    firstname = Column(String)
    lastname = Column(String)
    gender = Column(String(1))
    age = Column(Integer)

    def __init__(self, ssn, firstname, lastname, gender, age):
        self.ssn = ssn
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.age = age

    def __repr__(self):
        return f"({self.ssn}) {self.firstname} {self.lastname} ({self.gender},{self.age})"

class Thing(Base):
    __tablename__ = "things"
    
    tid = Column(Integer, primary_key=True)
    description = Column(String)  # Corrected the data type to String
    owner = Column(Integer, ForeignKey("people.ssn"))

    def __init__(self, tid, description, owner):
        self.tid = tid
        self.description = description 
        self.owner = owner

    def __repr__(self):
        return f"{self.tid} {self.description} owned by {self.owner}"

# Use the correct database name ('mydb') in the connection string
engine = create_engine("postgresql://postgres:amhb@localhost:5432/mydb2", echo=True)

Base.metadata.create_all(bind=engine)
Session = sessionmaker(bind=engine)
session = Session()

person = Person(12312, "Mike", "Smith", "m", 35)
session.add(person)
session.commit()

p1 = Person(31234, "Ana", "Blue", "f", 40)
p2 = Person(22356, "Bob", "Blue", "m", 45)
p3 = Person(12984, "Angela", "Cold", "f", 22)

session.add(p1)
session.add(p2)
session.add(p3)

session.commit()

#Select and show all of the Person
#results = session.query(Person).all()
#for a in results:
#   print(a)

#print(results)

#select and show only Person with last name Blue or Cold
#results = session.query(Person).filter(Person.lastname == "Cold")
#for r in results:
#   print(r)

#select and show in terminal for person Page that biger than 40
#results = session.query(Person).filter(Person.age > 40)
#for r in results:
 #print(r)

#select and show in terminal for person First name is like  >> .like("%A%"")
#results = session.query(Person).filter(Person.firstname.like("%An%"))
#for l in results:
 #print(l)

#select and show in terminal for person First name is In  >> .in(anna and mike)
#results = session.query(Person).filter(Person.firstname.in#(["Ana", "Mike"]))
#for r in results:
# print(r)


#but before that run the code we must delet the table of DB2
t1 = Thing(1, "Car", p1.ssn)
#session.add(t1)
#session.commit()

#add another subject to our table in DB2
t2 = Thing(2, "Car", p1.ssn)
t3 = Thing(2, "Laptop", p2.ssn)
t4 = Thing(4, "Car", p3.ssn)
t5 = Thing(5, "Book", p3.ssn)

#like first t1 we must add each session again and commit them
session.add(t2)
session.add(t3)
session.add(t4)
session.add(t5)
session.commit()

results = session.query(Thing, Person).filter(Thing.owner == Person.ssn).filter(Person.firstname == "Ana").all()
for r in results:
    print(r)

    














                       


