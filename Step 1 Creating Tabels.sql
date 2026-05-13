



Create table Books (
Book_ID Serial Primary Key,
Title VARCHAR(100),
Author VARCHAR(100),
Genre VARCHAR(100),
Published_Year INT,
Price NUMERIC(10,2),
Stock INT
);

Create Table Customers (
Customer_ID serial Primary key,
Name Varchar(100),
Email Varchar(100),
Phone VARCHAR(15),
City VARCHAR(100),
Country VARCHAR(150)
);

Create Table Orders (
Order_ID Serial Primary Key,
Customer_ID Int References Customers(Customer_ID),
Book_ID Int References Books(Book_ID),
Order_Date Date,
Quantity INT,
Total_Amount Numeric(10,2)
);



select * from Books;
Select * from Customers;
Select * from orders;
