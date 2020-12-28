USE Bank;

CREATE TABLE Employee
(
  id INT IDENTITY(1, 1) PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
)

CREATE TABLE Salary
(
  id INT IDENTITY(1, 1) PRIMARY KEY,
  salary INT NOT NULL,
  employee_id INT FOREIGN KEY REFERENCES Employee(id),
)

CREATE TABLE Customer
(
  id int IDENTITY(1,1) PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
)

CREATE TABLE Transactions 
(
  id INT IDENTITY (1, 1) PRIMARY KEY,
  customer_id INT FOREIGN KEY REFERENCES Customer(id),
  transaction_number INT NOT NULL,
  total  INT NOT NULL,
)

INSERT INTO Employee VALUES('Anna', 'Sargsyan');
INSERT INTO Employee VALUES('Suren', 'Tonoyan');
INSERT INTO Employee VALUES('Tigran', 'Vardanyan');
INSERT INTO Employee VALUES('Ani', 'Gevorgyan');

INSERT INTO Salary VALUES(40.000, 1);
INSERT INTO Salary VALUES(80.000, 2);
INSERT INTO Salary VALUES(90.000, 4);
INSERT INTO Salary VALUES(120.000, 3);

INSERT INTO Customer VALUES('Tigran', 'Surenyan');
INSERT INTO Customer VALUES('Meri', 'Balayan');
INSERT INTO Customer VALUES('Saten', 'Sargsyan');

INSERT INTO Transactions VALUES(2, 40, 30);
INSERT INTO Transactions VALUES(1, 80, 100);
INSERT INTO Transactions VALUES(3, 10, 80);

SELECT Employee.first_name, Salary.salary
FROM Employee
INNER JOIN Salary ON Salary.employee_id = Employee.id

SELECT Customer.first_name, Transactions.transaction_number, Transactions.total
FROM Customer
INNER JOIN Transactions ON Transactions.customer_id = Customer.id;