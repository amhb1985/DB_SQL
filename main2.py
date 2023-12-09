from sqlalchemy import create_engine, Column, String, Integer
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

# Use the correct database name ('mydb') in the connection string
engine = create_engine("postgresql://postgres:amhb@localhost:5432/mydb", echo=True)

Base.metadata.create_all(bind=engine)
Session = sessionmaker(bind=engine)
session = Session()

#person = Person(12312, "Mike", "Smith", "m", 35)
##session.add(person)
#session.commit()
#
#p1 = Person(31234, "Ana", "Blue", "f", 40)
#p2 = Person(22356, "Bob", "Blue", "m", 45)
#p3 = Person(12984, "Angela", "Cold", "f", 22)

#session.add(p1)
#session.add(p2)
#session.add(p3)

#session.commit()

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








                       