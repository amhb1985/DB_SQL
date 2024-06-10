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

# ... (vorheriger Code bleibt unverändert) ...

class Things(Base):
    __tablename__ = "things"
    
    tid = Column(Integer, primary_key=True)
    description = Column(String)  
    owner = Column(Integer, ForeignKey("people.ssn"))

    def __init__(self, tid, description, owner):
        self.tid = tid
        self.description = description 
        self.owner = owner

    def __repr__(self):
        return f"{self.tid} {self.description} owned by {self.owner}"

class Address(Base):
    __tablename__ = "address"

    aid = Column(Integer, primary_key=True)
    description = Column(String)
    street = Column(String)  # Hinzugefügt für die Straße
    owner = Column(Integer, ForeignKey("people.ssn"))

    def __init__(self, aid, description, street, owner):
        self.aid = aid
        self.description = description
        self.street = street
        self.owner = owner 

    def __repr__(self):
        return f"{self.aid} {self.description} on {self.street} owned by {self.owner}"

# ... (vorheriger Code bleibt unverändert) ...

# Use the correct database name for example ('mydb2') in the connection string
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


#but before that run the code we must delet the table of DB..
t1 = Things(1, "Car", p1.ssn)
t2 = Things(2, "Car", p1.ssn)
t3 = Things(2, "Laptop", p2.ssn)
t4 = Things(4, "Car", p3.ssn)
t5 = Things(5, "Book", p3.ssn)

#like first t1 we must add each session again and commit them
session.add(t1)
session.add(t2)
session.add(t3)
session.add(t4)
session.add(t5)
session.commit()

#we can now see as result, if u want u can delet# after code belog.
#results = session.query(Things, Person).filter(things.owner == Person.ssn).filter(Person.firstname == "Ana").all()
#for r in results:
 #   print(r)

#so then we can add another table for adrress
a1 = Address(1, "Car", p1.ssn)

a2 = Address(2, "sadjadsg street", p1.ssn)
a3 = Address(2, "asdas street", p2.ssn)
a4 = Address(4, "asdasdtte street", p3.ssn)
a5 = Address(5, "237 street ", p3.ssn)

session.add(a1)
session.add(a2)
session.add(a3)
session.add(a4)
session.add(a4)
session.add(a5)

session.commit()

#results = session.query(Address, Person).filter(address.owner == Person.ssn).filter(Person.firstname == "Ana").all()
#for d in results:
 #   print(d)


#leider der Adresees und der Things table sind nicht in der DB
# ich werde noch in andere datei probieren.

#test











                       


