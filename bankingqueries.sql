show databases ;

create database BankingDB;
use BankingDB;

create table customers(
    customerID INT,
    firstName varchar(50),
    lastName varchar(50),
    email varchar(100),
    phone varchar(10)
);

desc customers;

ALTER TABLE customers
ADD CONSTRAINT pk_customer_id PRIMARY KEY (customerID);

select * from customers;

ALTER table customers
ADD AccountCreationDate Date;

CREATE TABLE Accounts (
AccountID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);

ALTER TABLE Accounts
ADD CONSTRAINT pk_Account_id PRIMARY KEY (AccountID);

CREATE TABLE Transactions (
TransactionID INT,
TransactionDate DATE,
Amount DECIMAL,
TransactionType VARCHAR(10)
);

ALTER TABLE Transations
ADD CONSTRAINT pk_Transaction_id PRIMARY KEY (TransactionID);

CREATE TABLE Branches (
branchID INT,
branchName VARCHAR(100),
branchAddress VARCHAR(200),
branchPhone VARCHAR(15)
);

ALTER TABLE Branches
ADD CONSTRAINT pk_branch_id PRIMARY KEY (branchID);

desc Branches;

CREATE TABLE Loans (
LoanID INT,
LoanAmount DECIMAL(10,2),
InterestRate DECIMAL(5,2),
StartDate DATE,
EndDate DATE
);

ALTER TABLE Loans
ADD CONSTRAINT pk_loan_id PRIMARY KEY (LoanID);

desc Loans;

CREATE TABLE AccountBranches (
    AssignmentDate DATE
    );

desc loans;

ALTER TABLE customers
ADD DateOfBirth DATE;

desc customers;

ALTER TABLE customers
MODIFY Phone VARCHAR(20);

desc customers;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBAlance
CHECK (Balance >= 100);

desc accounts;

DROP TABLE AccountBranches;

DROP TABLE Branhes;

DROP TABLE Transctions;

ALTER TABLE Accounts
ADD customerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT Fk_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

alter table Accounts
drop column customersID;

desc Accounts;

ALTER TABLE customers
MODIFY Firstname VARCHAR(50) NOT NULL;

desc customers;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);

desc Customers;

ALTER TABLE Accounts
DROP COLUMN Customers;

ALTER TABLE customers
ALTER COLUMN lastname set default "NA";

ALTER TABLE Accounts
ADD branchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT Fk_Accounts_Branches
FOREIGN KEY (branchID)
REFERENCES Branches(branchID);

desc Accounts;

ALTER TABLE Accounts
DROP COLUMN Branches;

ALTER TABLE Transactions
ADD AccountID INT;

ALTER TABLE Transactions
ADD CONSTRAINT fk_AccountID
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

desc Transactions;

ALTER TABLE Loans
ADD customerID INT;

ALTER TABLE Loans
ADD CONSTRAINT fk_customerID
FOREIGN KEY (customerID)
REFERENCES customers(customerID);

desc loans;


CREATE TABLE KYC (
KYCID INT PRIMARY KEY,
AadharNo VARCHAR(12) NOT NULL,
PanNo VARCHAR(10) NOT NULL,
CustomerID INT NOT NULL,
CONSTRAINT fk_customer
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

desc KYC;

SHOW CREATE TABLE KYC; -- you can change table name as per your requirement 

-- you can get information about constraint applies on a secific table 
-- by the query written below

SELECT 
CONSTRAINT_NAME,
CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'bankingdb'
AND TABLE_NAME = 'kyc';

INSERT INTO Customers
VALUES
(101,'Amit','Sharma','amit@gmail.com','9876543210','2024-01-15','1998-05-10');

INSERT INTO Customers
(customerid,firstname,lastname,email,phone,accountcreationdate,dateofbirth)
VALUES(102,'Priya','Patil','priya@gmail.com','2343532523','2024-02-15','1999-08-22');

select * from Customers;

INSERT INTO Customers
(phone,email,lastname,firstname,accountcreationdate,dateofbirth,customerid)
values ('9876543212','rahul@gmail.com','Verma','Rahul','2024-03-12','1997-11-14',103);

INSERT INTO Customers
VALUES
(104,'Sneha','Joshi','sneha@gmail.com','9876543213','2024-04-18','2000-01-05'),
(105,'Karan','Mehta','karan@gmail.com','9876543214','2024-05-25','1996-12-30');

INSERT INTO Branches
VALUES
(1,'Nagpur Branch','Sitabuldi, Nagpur','0712-123456'),
(2,'Pune Branch','Shivaji Nagar, Pune','020-223344'),
(3,'Mumbai Branch','Andheri, Mumbai','022-334455');

select * from branches;


INSERT INTO Accounts
VALUES
(1001,'Savings',25000,1,101),
(1002,'Current',45000,2,102),
(1003,'Savings',18000,1,103),
(1004,'Current',72000,3,104),
(1005,'Savings',15000,2,105);


select * from accounts;

INSERT INTO Transactions
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);

select * from transactions;

INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);

select * from loans;

UPDATE customers
set email = 'amit2026@yahoo.com'
where customerid = 101;

UPDATE customers
set lastName = 'joshi'
where customerid = 102;

select * from customers;
select * from branches;

UPDATE branches
set branchaddress = 'Civil, Nagpur',
branchphone = '9766-641822'
where branchID = 1;

select * from branches;

select * from KYC;

INSERT INTO KYC 
values (701,'273856438989','UNKJG2323J',101),
(702,'232267437628','UNKHG5643K',103),
(703,'245479333783','UNKID8962K',102);

SELECT * FROM KYC;

DELETE FROM KYC WHERE KYCID = 702;

DELETE FROM KYC;



select accountid,accounttype,balance 

select * from customers
where customerid = 104;


SELECT 
    *
FROM
    accounts
WHERE
    accounttype = 'savings'
        AND balance > 20000;
        
        SELECT 
    *
FROM
    accounts
WHERE
    accounttype = 'savings'
        OR balance > 20000;
        -- find all accounts where account type 
        select * from accounts
        where NOT accounttype >= 'Savings' ;
        
         select * from accounts
        where NOT accounttype = 'Savings' ;
        
         select * from accounts
        where NOT accounttype != 'Savings' ;
        
         select * from accounts
        where NOT accounttype <> 'Savings' ;
        
        select * from loans; 
        
        select * from loans
        where interestrate = 8.5 OR interestrate = 9.0;


 select * from loans
        where interestrate IN (8.5,9.0);
        
        select * from transactions
where Transactiontype not in ("deposit", "withdrawal");
        
        select * from loans
        where interestrate BETWEEN 7.5 AND 8.5;
        
        -- find all customer having alance between 20k and 60k 
        select * from accounts
        where balance BETWEEN 20000 and 60000;
        
        -- find all customer having alance between 20k and 60k 
        -- and account type should be current 
        select * from accounts
        where balance BETWEEN 20000 and 60000 and accounttype = 'current';
        
        select * from customers;
        
        -- LIKE operator
        select * from customers
        where lastname LIKE 'J%';
        
         select * from customers
        where lastname LIKE '%a';
        
        select * from customers
        where firstname LIKE '%a';
        
        select * from customers
        where firstname LIKE '%ya';
        
        select * from customers
        where firstname LIKE 'P____';
        
          select * from customers
        where firstname LIKE 'A___';
        
        select * from customers;
        
        select * from accounts;
        
        -- Sort accounts table as per balance in descending order
        
        select * from accounts
        order by balance;
        
        select * from accounts
        order by balance desc;
        
        select * from accounts
        order by balance desc, balance desc ;
        
       -- - Extra practice data for banking_db (MySQL 8.0)
-- Run AFTER the original dump has been restored.
-- Insert order respects foreign keys: branches -> customers -> accounts -> kyc -> loans -> transactions
-- NOTE: chk_MinBalance requires Balance >= 1000 (NULL is allowed by a CHECK constraint).
-- NOTE: Aadhaar / PAN values below are FAKE, for practice only.

USE banking_db;

        
        -- BRANCHES  (NULL address / NULL phone; branch 6 has no accounts)
        INSERT INTO branches (BranchID, BranchName, BranchAddress, BranchPhone) VALUES
(4, 'Nashik Branch',      'College Road, Nashik',      NULL),
(5, 'Chandrapur Branch',  NULL,                        '07172-250100'),
(6, 'Aurangabad Branch',  'Station Road, Aurangabad',  '0240-334455');

select * from branches;

INSERT INTO customers (customerID, FirstName, lastname, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(106, 'Neha',   'Kulkarni', 'neha.k@gmail.com',       '9876543215', '2024-06-10', '1995-03-18'),
(107, 'Vikram', 'Singh',    NULL,                     '9876543216', '2024-07-01', '1994-07-07'),
(108, 'Anjali', NULL,       'anjali@outlook.com',     NULL,         '2024-08-14', '2001-09-12'),
(109, 'Rohan',  'Deshmukh', 'rohan.d@yahoo.com',      '9876543218', NULL,         '1993-02-25'),
(110, 'Pooja',  'Joshi',    'pooja@gmail.com',        '9876543219', '2024-09-30', NULL),
(111, 'Suresh', 'Patil',    NULL,                     NULL,         '2024-10-05', '1990-06-15'),
(112, 'Meera',  'Nair',     'meera.nair@gmail.com',   '9876543221', '2025-01-20', '1999-12-01'),
(113, 'Amit',   'Verma',    'amitv@rediffmail.com',   '9876543222', '2025-02-11', '1998-05-10'),
(115, 'Sanjay', 'Mehta',    'sanjay.m@gmail.com',     NULL,         '2025-04-09', '1988-10-28');

select * from customers;

-- lastname omitted on purpose, so the DEFAULT 'NA' is applied
INSERT INTO customers (customerID, FirstName, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(114, 'Kavita', 'kavita@gmail.com', '9876543223', '2025-03-03', '2002-04-17');
        
        -- ACCOUNTS  (NULL AccountType / Balance / CustomerID / BranchID)
-- Customers 114 and 115 intentionally have NO account.
-- ---------------------------------------------------------
INSERT INTO accounts (AccountID, AccountType, Balance, CustomerID, BranchID) VALUES
(1006, 'Savings', 32000.00,  106,  1),
(1007, 'Current', 150000.00, 107,  3),
(1008, 'Savings', NULL,      108,  2),
(1009, NULL,      5000.00,   109,  4),
(1010, 'Savings', 1000.00,   110,  4),
(1011, 'Current', 98000.00,  111,  5),
(1012, 'Savings', 12000.00,  112,  NULL),
(1013, 'Current', 27500.50,  101,  3),
(1014, 'Savings', 60000.00,  NULL, 1),
(1015, 'Savings', 8500.00,   113,  2);

select * from accounts;
        
-- KYC  (table was empty; only some customers have KYC)
-- No KYC for 108, 110, 111, 113, 114, 115
-- ---------------------------------------------------------
INSERT INTO kyc (kycid, aadharNo, panNo, customerid) VALUES
(1, '234567890123', 'ABCPS1234A', 101),
(2, '345678901234', 'BCDPJ2345B', 102),
(3, '456789012345', 'CDEPV3456C', 103),
(4, '567890123456', 'DEFPJ4567D', 104),
(5, '678901234567', 'EFGPM5678E', 105),
(6, '789012345678', 'FGHPK6789F', 106),
(7, '890123456789', 'GHIPS7890G', 107),
(8, '901234567890', 'HIJPD8901H', 109),
(9, '112233445566', 'IJKPN9012I', 112);

select * from kyc;

-- LOANS  (NULL InterestRate / LoanAmount / EndDate / CustomerID)
-- ---------------------------------------------------------
INSERT INTO loans (LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID) VALUES
(504, 400000.00, 8.25, '2025-01-10', '2030-01-10', 105),
(505, 150000.00, NULL, '2025-02-01', '2027-02-01', 106),
(506, 900000.00, 7.50, '2025-03-05', NULL,         107),
(507, NULL,      9.50, '2025-04-01', '2029-04-01', 109),
(508, 300000.00, 8.50, '2025-05-15', '2030-05-15', 101),
(509, 120000.00, 10.00,'2025-06-01', '2026-06-01', NULL);
        
        select * from loans;
        
        -- TRANSACTIONS  (NULL Amount / TransactionType / AccountID / TransactionDate)
-- Accounts 1008, 1009, 1012, 1014 have no transactions.
-- ---------------------------------------------------------
INSERT INTO transactions (TransactionID, TransactionDate, Amount, TransactionType, AccountID) VALUES
(6,  '2025-01-18', 1500.00,  'Deposit',    1005),
(7,  '2025-01-20', NULL,     'Deposit',    1006),
(8,  '2025-02-02', 4500.00,  'Withdrawal', 1006),
(9,  '2025-02-05', 20000.00, 'Deposit',    1007),
(10, '2025-02-10', 2500.00,  NULL,         1007),
(11, '2025-02-14', 800.00,   'Transfer',   1001),
(12, '2025-02-20', 12000.00, 'Transfer',   1004),
(13, '2025-03-01', 6000.00,  'Deposit',    NULL),
(14, '2025-03-05', 3500.00,  'Withdrawal', 1010),
(15, NULL,         9000.00,  'Deposit',    1011),
(16, '2025-03-15', 500.00,   'Withdrawal', 1002),
(17, '2025-03-18', 15000.00, 'Deposit',    1013),
(18, '2025-04-01', 2200.00,  'Withdrawal', 1013),
(19, '2025-04-10', 7500.00,  'Deposit',    1001),
(20, '2025-04-12', 1000.00,  'Transfer',   1015);

select * from transactions;

-- Quick sanity check
SELECT 'branches' AS tbl, COUNT(*) AS cnt FROM branches
UNION ALL SELECT 'customers', COUNT(*) FROM customers
UNION ALL SELECT 'accounts', COUNT(*) FROM accounts
UNION ALL SELECT 'kyc', COUNT(*) FROM kyc
UNION ALL SELECT 'loans', COUNT(*) FROM loans
UNION ALL SELECT 'transactions', COUNT(*) FROM transactions;



-- DISTINCT CLAUSE
select DISTINCT accounttype from accounts;
select distinct transactiontype from transactions;
select distinct customerid,loanid from loans;

-- limit clause 
select * from transactions
LIMIT 5;
select * from transactions
order by amount desc
limit 3;

-- find top 2 transactions having highest withhdrawal amount 
select * from transactions
where transactiontype = "withdrawal"
order by Amount desc
limit 2;

-- OFFSET clause
select * from customers;
select * from customers
LIMIT 5 OFFSET 5;

-- find the customer having highest loan amount.
select * from loans
Order by loanamount desc
LIMIT 1 OFFSET 2;

-- NULL
select customerID,firstname,lastname,email from customers 
where email IS NOT NULL;

select customerID,firstname,lastname from customers 
where lastname IS NULL;

select customerID,firstname,lastname,email,phone from customers 
where email IS NULL AND phone IS NULL;
-- where email IS NULL OR phone IS NULL;

-- CASE Statements
select * from loans;

select loanid,loanamount,customerid,g
case 
when loanamount >= 500000 THEN "High value loan"
when loanamount >= 200000 THEN "Median value loan"
ELSE "Low value loan"
END AS LoanCategory
FROM loans;

USE bankingdb;
Select * from Customers
Where Email is Null;

SELECT * FROM Customers
WHERE Phone IS NOT NULL;

SELECT
    FirstName,
    Email,
    Phone,
    COALESCE(Email, Phone, 'No contact') AS BestContact
FROM Customers;

SELECT
    AccountID,
    Balance,
    Balance > 30000 AS Result,
    (Balance > 30000) IS UNKNOWN AS IsUnknown
FROM Accounts;

select AccountID,
balance,
balance > 30000 AS RESULT,
( balance > 30000) IS UNKNOWN AS Isunknown
from accounts;

SELECT
    COUNT(*) as TotalRows,
    COUNT(LoanAmount) as Loanamountcount,
    COUNT(InterestRate) as Interestratecount
FROM loans;

-- String function 

select upper("hello");

select upper(firstname) AS FirstName, Phone, email, from customer;
select lower ;

-- length() function 
SELECT LENGTH('NAGPUR') AS 'NoOfCharacters';-- gives o/p in number of bytes
SELECT LENGTH('नागपूर')p in number of bytes
Select char_length("NAGPUR"); -- gives o/p in number of characters
Select char_length("नागपूर"); -- gives o/p in number of characters

-- concat() function

select concat("hello"," ","World") as ConcatenatedString;
select concat(firstname," ",lastname) as fullname, phone,email from customers;


-- substring() or substr() function
select substr("Hello World India",7,5) as extractedstring;

select customerid, concat(substr(firstname,1,1),".",lastname) as fullname, phone,email from customers;

-- trim() function

SELECT LENGTH('hello World');
SELECT LENGTH(TRIM(' Hello World  '));
SELECT LENGTH(TRIM(SUBSTRING('Hello World', 6)));

-- replace() function

select replace("Mat mat Mat","M","C");

-- Round() function


select avg(Balance) from accounts
where accounttype = "savings";

select round(avg(Balance),2) as Avgbalance from accounts
where accounttype = "savings";

select round(3.6);
select round(3.3);
select round(3.5);

-- Ceil() or Ceiling() function
select ceiling(avg(Balance)) from accounts
where accounttype = "Savings";

-- floor() function

select floor(avg(Balance)) from accounts
where accounttype = "savings";


-- Absolution() function .... It removes the sign
select abs(-3656);
select abs(-1.34);
select abs(6.464);

-- mod() function
select  (7/3);
select mod(7,3);

-- power()
select power(2.3);
select power(1.5,3);

-- SQRT()

select sqrt(123);
select sqrt(144);

select customerid,FirstName,dateofbirth,
year(dateofbirth),month(dateofbirth),day(dateofbirth)
from customers where customerid = 104;

select customerid,FirstName,dateofbirth,
year(curdate()) - year(dateofbirth) as age
from customers;

select firstname, dateofbirth, 
round(datediff(curdate(),dateofbirth) / 365,1) as age 
from customers;

select firstname, dateofbirth, 
concat(firstname," age is ",round(datediff(curdate(),dateofbirth) / 365,1)) as age 
from customers;

select concat(firstname," ",lastname) as fullname,
accountcreationdate,
date_add(accountcreationdate,interval 1 year) as KYCRenewal
from customers;

select date_sub(curdate(),interval 7 day);

-- Aggregate functions

-- Calculate the total balance maintained acress all customer acounts

select * from accounts;
select sum(balance) totalBalance from accounts;
select avg(balance) averageBalance from accounts;

-- Identify the highest balance maintained in any customer account
SELECT MIN(Balance) AS highest_balance
FROM accounts;

-- Determine the total number of customer accounts
-- available in the system
select count(*) as NoofAccounts from accounts;

-- Group by 
select accounttype, count(*) as Noofaccounts
from accounts
group by accountype;

select accounttype, sum(balance) as noofAccounts
from accounts
group by accounttype;

-- find total amount by transaction type 
select * from transactions;
select transactiontype, sum(amount) as TotalAmount
from transactions
group by transactiontype;

-- find total accounts for branch and transactiontype;
select * from accounts;

select branchid, accounttype, count(*) as noofAccounts
from accounts
group by branchid, accounttype
order by noofAccounts desc;

-- HAVING CLAUSE 
-- find transaction type where total amount for tht transaction type 
select transactiontype, sum(amount) as TotalAmount
from transactions
group by transactiontype
-- having sum(amount) > 20000;
having totalAmount > 20000;

select transactiontype, sum(amount) as TotalAmount
from transactions
group by transactiontype
having totalAmount > 10000 and transactiontype = "deposit";

-- find the number of customers joined according to the year from customers table
select * from customers;

select year(accountcreationdate) as years, count(*) as totalCustomers
from customers
group by years
order by totalcustomers desc;

select * from loans;
-- find total loan amount for all the customers.
SELECT customerid, sum(loanAmount) AS TotalLoanAmount
FROM Loans
group by customerid
order by Customerid;

-- display distinct BranchID from accounts
-- where Balance is greater than 30,000
select * from accounts;
select branchid, (branchid) balance from accounts
where balance > 30000;

-- display all savings accounts belonging to branch 1 or branch 3 .
select * from accounts;

select * from accounts 
where Accounttype = "Savings" AND branchid = 1 or branchid = 3;

-- find the average balance of current accounts for each branch. 
-- display only branches where the Average balance exceeds 40000.

select branchid, avg(balance) as avgbalance from accounts
where accounttype = "Current"
group by branchid;


-- Branches (by BranchID) having more than one account (HAVING).
select Branchid, count(*) as Accounts
From Accounts group by Branchid having count(*) > 1;

-- Top 3 accounts by balance. Show how NULLs sort in ASC vs DESC.
select * from accounts 
ORDER BY Balance DESC LIMIT 3;
select * from accounts 
ORDER BY Balance ASC;

-- Total and average balance per AccountType. 
-- How are NULL types and NULL balances treated?

select accounttype, sum(balance) as total, avg(balance) as average 
from accounts group by accounttype;

select * from customers;
select * from accounts;

-- JOIN
 --  join combines relates rows from different 
 -- tables based on a common column
 
 -- 1. INNER JOIN
 -- Matches rows that exist in both tables

-- find all customers who have accounts and show their balance.
select * from customers;
select * from accounts;

select c.CustomerID,c.firstname,c.lastname,a.accounttype,a.balance
from customers c
inner join accounts a 
on c.customerID = a.customerID;

-- find all the customers who have loans.
-- output should contain customerid,firstname, lastname, phone, loanamount
select * from customers;
select c.CustomerID,c.firstname,c.lastname,c.phone,l.loanamount
from customers c
inner join loans l # by default mysql uses inner join if join type is not mention in query 
on c.customerid = l.customerid;

# Get customerid,customer name,account type, balance , branch name from related tables.

SELECT 
    c.customerid,
    CONCAT_WS(' ', c.firstname, c.lastname)as fullname,
    a.accounttype,
    a.balance,
    b.branchname
FROM
    customers c
        INNER JOIN
    accounts a ON c.customerid = a.customerid
        INNER JOIN
    branches b ON a.branchid = b.branchid
    order by c.customerid;
    
    # LEFT JOIN
    # Returns all rows from the left table, and matched rows from the right 
    -- Get data for all customers and show their balance.
select c.customerid,c.firstname,c.lastname,a.accounttype,a.balance
 from customers c
 left join accounts a 
 on c.customerid = a.customerid;
 -- where a.accounttype is NULL and a.balancce is NULL;

-- RIGHT JOIN
select c.customerid,c.firstname,c.lastname,a.accounttype,a.balance
 from customers c
 right join accounts a 
 on c.customerid = a.customerid;
 
 -- UNION 
 select * from customers c
 left join accounts a 
 on c.customerid = a.customerid
 UNION
 select * from customers c
 right join accounts a 
 on c.customerid = a.customerid;
 
 -- CROSS JOIN
 select * from customers c
 cross join accounts a ;
 
 -- find the number of accounts held by each customer.
 select c.customerid,c.firstname,c.lastname,count(a.accounttype) as NoofAccounts
 from customers c 
 left join accounts a 
 on c.customerid = a.customerid
 group by Customerid;
 
 select * from customers;
select * from accounts;
 
 # find the number of  customers for each account type.
 select accounttype, count(*)
 from accounts
group by accounttype;
 
 select a.accounttype,count(a.customerid) as totalcustomers
 from accounts a 
 left join customers c
 on a.customerid  = c.customerid
 group by a.accounttype;
 
 -- find customers who have more than one account.
 select c.customerid,c.firstname,c.lastname,count(a.accountid) as Noofaccounts
 from customers c
left join accounts a  
 on c.customerid = a.customerid
 group by c.customerid
 having Noofaccounts > 1;
 
 -- find customers who have never performes a transaction.
 select * from customers;
select c.customerid, c.firstname,c.lastname,a.accountid,a.accounttype
from customers c
right join accounts a 
on c.customerid = a.customerid
left join transactions t 
on a.accountid = t.accountid
where t.transactionid IS NULL;

select * from accounts;
 
 
 -- SELF JOIN
 -- Not a new keyboard -- just a regular join where a table is joined to itself,
 -- using two aliases. Perfect for hierarchies: here, matching each 
 -- employee to their manager, who is also an amployee.
 
 CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    ManagerID INT,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    BranchID INT,
    FOREIGN KEY (ManagerID)
    REFERENCES Employees(EmployeeID),
    FOREIGN KEY (BranchID)
    REFERENCES Branches(BranchID)
);

desc employees;
select * from branches;
INSERT INTO Employees
    (EmployeeID, EmployeeName, ManagerID, Department, Salary, JoiningDate, BranchID)
VALUES
    (1, 'Rajesh Sharma', NULL, 'Management', 120000.00, '2018-04-15', 1),
    (2, 'Priya Patel', 1, 'Human Resources', 75000.00, '2019-06-10', 2),
    (3, 'Amit Kumar', 1, 'Finance', 82000.00, '2020-01-20', 3),
    (4, 'Sneha Verma', 1, 'IT', 95000.00, '2019-09-05', 4),
    (5, 'Rahul Singh', 1, 'Sales', 78000.00, '2021-03-12', 5),

    (6, 'Neha Joshi', 2, 'Human Resources', 55000.00, '2021-07-19', 1),
    (7, 'Vikas Gupta', 2, 'Human Resources', 52000.00, '2022-02-14', 2),
    (8, 'Pooja Mehta', 3, 'Finance', 60000.00, '2021-11-08', 3),
    (9, 'Suresh Yadav', 3, 'Finance', 58000.00, '2022-05-16', 4),
    (10, 'Anjali Deshmukh', 4, 'IT', 72000.00, '2020-08-24', 5),

    (11, 'Rohan Kulkarni', 4, 'IT', 68000.00, '2021-10-11', 1),
    (12, 'Kavita Rao', 4, 'IT', 65000.00, '2022-01-17', 2),
    (13, 'Arjun Malhotra', 5, 'Sales', 57000.00, '2022-06-20', 3),
    (14, 'Meena Shah', 5, 'Sales', 59000.00, '2021-12-06', 4),
    (15, 'Deepak Thakur', 5, 'Sales', 54000.00, '2023-01-09', 5),

    (16, 'Nitin Pawar', 6, 'Human Resources', 42000.00, '2023-04-18', 1),
    (17, 'Swati Mishra', 7, 'Human Resources', 40000.00, '2023-07-03', 2),
    (18, 'Manish Jain', 8, 'Finance', 45000.00, '2023-02-27', 3),
    (19, 'Komal Sinha', 9, 'Finance', 43000.00, '2023-08-14', 4),
    (20, 'Akash Bansal', 10, 'IT', 50000.00, '2023-05-22', 5);

    select * from employees;
 
 -- employeeName and Emplyeemanager
 select e.employeeid, e.employeename as EmployeeName, m.EmployeeName as ManagerName
 from employees e 
 left join employees m
 on e.managerID = m.employeeID;
 
 # include branch 
 select e.employeeid, e.employeename as EmployeeName, m.EmployeeName as ManagerName,
 b.branchName
 from employees e 
 left join employees m
 on e.managerID = m.employeeID
 join branches b
 on e.branchid = b.branchid
 order by e.employeeid;
 
 -- find all the employees who reports to sneha verma 
 select e.employeeid, e.employeename as EmployeeName, m.employeeName as managerName
 from employees e
 join employees m
 on e.managerid = m.employeeid
 where m.employeename = "Sneha Verma";
 
 -- find employees who does not have any manager.
 select e.employeeid, e.employeename as EmployeeName, m.employeeName as managerName
 from employees e
 left join employees m
 on e.managerid = m.employeeid
 where e.managerid is null;
 
 -- SUBQUERIES
 -- find all customers having balance more than the average balance 
 select * from accounts;
 select avg(balance) from accounts;
 
 select customerid, balance, accounttype from accounts
 where balance > 40642;
 
 
 select accountid, customerid, balance, accounttype
from accounts
where balance > (
select avg(balance) from accounts
);

-- find all customers having balance more than the average balance
-- in the saving account.alter

select * from accounts;

select avg(balance) from accounts
where accounttype = "Savings";

select c.firstname, a.balance from customers c
join accounts a 
on c.customerId = a.customerid
where a.accounttype = "savings";

-- SCALAR SUBQUERY

-- A scalar subquery returns exactly one row and one column.
select * from accounts;
select customerid, accountid, accounttype, balance
from accounts
where balance > (select avg(balance) from accounts where accounttype = "Savings")
&& accounttype = "Savings";


select * from accounts;
select c.customerid, c.firstname, a.accountid, a.accounttype, a.balance
from accounts a
left join customers c 
on a.Customerid = c.customerid
where balance > (select avg(balance) from accounts where accounttype = "Savings")
&& accounttype = "Savings";

-- find the acount(s) having the highest balance.
select accountid, accounttype, balance
from accounts 
where balance = (select max(balance) from accounts);

-- find customers whose year of birth is earlier than the average year of birth of all customers.
select * from customers;
select customerid, firstname,lastname,dateofbirth
from customers
where year(dateofbirth) < (select avg(year(dateofbirth)) from customers);

# Multi-Row Subquery
-- A multiple row subquery returns more than one row, usually a single column.

-- find all customers who have taken at least one loan
select * from loans;
select * from customers;

select c.customerid, c.firstname, l.loanamount
from customers c
join loans l
on c.customerid = l.customerid;


select customerid,firstname from customers
where customerid in
 (select customerid from loans);

-- find all customes who have at least one savings account

select customerid,firstname from customers where customerid in 
(select customerid from accounts where accounttype = "savings");

select * from accounts;

-- update customerid to 114 where 
update accounts set customerid = 114
where accountid = 1014;

-- update accounttype of account id 1009 to current.
UPDATE accounts set accounttype = "Current"
where accountid = 1009;

 -- update balance to 1100 for accountid 1008
 UPDATE accounts set balance = 1100
 where accountid = 1008;
 
 -- update branchid to 5 for accountid 1012
UPDATE accounts set branchid = 5
where accountid = 1012;
 
 select * from branches;
 select * from customers;
 select * from loans;
 select * from transactions;
 
 -- add account creation date for customerid 109
 update  customers set accountcreationdate = "2026-01-12"
 where customerid = 109;
 
 UPDATE loans set loanamount = 200000
 where loanid = 507;
 
 UPDATE loans set customerid = 104
 where loanid = 509;
 
 update transactions set amount = 6500
 where transactionid = 7;

UPDATE transactions set transactiontype = "Withdrawal"
where transactionid = 10;

UPDATE transactions set accountid = 1006
where transactionid = 13;


-- find all customers who have an account in BranchID = 1.
select * from customers;
select customerid, firstname, lastname from customers
where customerid in 
(select customerid from accounts where branchid = 1);


-- find all accounts whose balance is grater than
-- any account in Branchid = 1
-- ANY

select * from accounts where branchid = 1;
select accountid, accounttype, balance, customerid
from accounts
where balance > ANY
(select balance from accounts where branchid = 1);

 -- find all accounts whose balance is grater than
-- all account in Branchid = 1
-- ALL 

select accountid, accounttype, balance, customerid
from accounts
where balance > ALL
(select balance from accounts where branchid = 1);

-- find the branch with the highest average account balance
select * from accounts;
select branchid, avg(balance) as avgbalance 
from accounts
group by Branchid
order by avgbalance desc 
limit 1;


select branchid,avg(balance) as avgbal from accounts
group by branchid
having avgbal >= ( 
select max(avgbalance) from
(select avg(balance) as avgbalance from accounts
group by branchid) as t);

UPDATE accounts set balance = 33333
where accountid = 1013;
        
        
-- CORRRELATED SUBQUARY
-- def: A correlated subquery references one or more columns from the outer query.
-- It cannot execute independently and runs once for each row of the outer query.

--  Find accounts whose balance is greater than 
-- the average balance of their respective branch
select * from accounts;

select a.accountid, a.branchid
from accounts a
where a.balance > ( 
select avg(balance)
from accounts 
where branchid = a.branchid);
 
 # homework
 -- find employees whose salary is greater than
 -- the average salary of their respective department.
 select * from employees;
 select e.employeeid, e.employeename, e.department, e.salary
 from employees e
 where e.salary > (
 select avg(e1.salary)
 from employees e1
 where e1.department = e.department
 );
 
 
 # find customers who have more than one accounts.
select * from customers;
select * from accounts;

select customerid,count(balance) as total_accounts
from accounts
group by customerid
having count(balance) > 1;
 -- 
select c.customerid , c.firstname, c.lastname
from customers c where (
select count(*) from accounts a 
where c.customerid = a.customerid
) > 1 ;


-- TABLE SUBQUERY
-- defition : - A table subquery returns multiple rows and multiple columns.
-- It is used inside the FROM clause and behaves like a temporary table.
-- RULE: The subquery must have an alias

-- find the average account balance for each account type
-- using a derived table.
select * from accounts;
select accountTypeBalance.accounttype, accountTypebalance.avgBalance
from
(select accounttype, avg(balance) as avgBalance
from accounts 
group by accounttype) as accountTypeBalance;

-- Diaplay only those account types whose average balance is 
-- greater than 30,000
select accountTypeBalance.accounttype, accountTypebalance.avgBalance
from
(select accounttype, avg(balance) as avgBalance
from accounts 
group by accounttype) as accountTypeBalance
where accountTypeBalance.avgBalance > 30000;

-- find the top 3 customers based on their total account here 
select * from accounts;
select customerTotalBalance.customerid, customerTotalBalance.firstname, customerTotalBalance.TotalBalance
from
(select c.customerid,c.firstname, sum(a.balance) as totalbalance
from customers c
join accounts a
on c.customerid = a.customerid
group by c.customerid) as customerTotalBalance
order by customerTotalBalance.TotalBalance desc
limit 3;

-- Subquery in SELECT Clause
-- subquery in the SELECT clause is typically a scalar subquery used to create a derived column.

-- Display each customer along with the number of ccounts they have 
select * from customers;
select c.customerid, c.firstname, (
select COUNT(*)
from accounts a 
where a.customerid = c.customerid
) as NoOfaccounts
from customers c;

-- Subquery inside UPDATE clause

-- Increase the balance of accounts belonging to customers
-- who have taken a loan by 5%
select * from loans;
select * from accounts;
UPDATE accounts set balance = balance + (0.05 * balance)
where customerid in (select customerid from loans);

-- Subquery insise DELETE clause 

-- Delete all transactions below amount of 100 where transaction type is withdrawal.
select * from transactions;
DELETE from transactions
where transactionid in (select transactionid from (select Transactionid from transactions
where Transactiontype = "Withdrawal" and amount < 1000) as t );

-- SUBQURY INSIDE INSERT CLAUSE
-- Create a HighValueAccounts table and insert all accounts whose 
-- balance is greater than the average account balance.
CREATE TABLE HighValueAccounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES customers(customerID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

select * from highvalueaccounts;
insert into highvalueaccounts (accountid,customerid,branchid,accounttype,balance)
select accountid,customerid,branchid,accounttype,balance from accounts
where balance > (
select avg(balance) from accounts
);

-- Create a HighBalanceCustomers table and insert customers whose
-- total account balance is greater than 50,000










