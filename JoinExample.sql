USE BankDB;

CREATE TABLE Employee(
id int identity(1,1) PRIMARY KEY,
	first_name varchar(30),
	last_name varchar(30),
	)

CREATE TABLE Salary(
id int identity(1,1) PRIMARY KEY,
salary int,
employee_id int FOREIGN KEY REFERENCES Employee(id),
)

CREATE TABLE Customer(
id int identity(1,1) PRIMARY KEY,
first_name varchar(30),
last_name varchar(30),
)

CREATE TABLE Transaction_ (
id int identity(1,1) PRIMARY KEY,
customer_id int FOREIGN KEY REFERENCES Customer(id),
transaction_number int,
total  int,
)

INSERT INTO Employee VALUES('Anna','Sargsyan')
INSERT INTO Employee VALUES('Suren','Tonoyan')
INSERT INTO Employee VALUES('Tigran','Vardanyan')
INSERT INTO Employee VALUES('Ani','Gevorgyan')

INSERT INTO Salary VALUES(40.000,1)
INSERT INTO Salary VALUES(80.000,2)
INSERT INTO Salary VALUES(90.000,4)
INSERT INTO Salary VALUES(120.000,3)

INSERT INTO Customer VALUES('Tigran','Surenyan')
INSERT INTO Customer  VALUES('Meri','Balayan')
INSERT INTO Customer  VALUES('Saten','Sargsyan')

INSERT INTO Transaction_ VALUES(2,40,30)
INSERT INTO Transaction_ VALUES(1,80,100)
INSERT INTO Transaction_ VALUES(3,10,80)

SELECT Employee.first_name,Salary.salary
FROM Employee
INNER JOIN Salary ON Salary.employee_id=Employee.id

SELECT Customer.first_name,Transaction_.transaction_number,Transaction_.total
FROM Customer
INNER JOIN Transaction_ ON Transaction_.customer_id=Customer.id;
