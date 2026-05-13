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
Customer_ID Int Reference Customers(Customer_ID),
Book_ID Int Reference Books(Book_ID),
Order_Date Date,
Quantity INT,
Total_Amount Numeric(10,2)
);

Select * from Books;
Select * from Customers;
Select * from Orders;

-- // ONLINE BOOK STORE BUSSINESS PROBLEMS

-- 1). RETRIVIE ALL BOOKS IN THE "FICTION" GENRE:
Select * from Books
where Genre = 'Fiction';


-- 2). FIND books published after the year 1950
Select * from Books 
where published_year > 1950;

-- 3). LIST ALL THE CUSTOMER FROM CANADA
Select * from Customers
where Country = 'Canada';

-- 4). SHOW ORDERS PLACED IN NOVEMBER 2023.
Select * from Orders
where order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5). RETRIEVE THE TOTAL STOCK OF BOOKS AVAILABLE
SELECT sum(stock) as Total_Stocks
from Books;

--6). FIND THE DETAILS OF THE MOST EXPENSIVE BOOKS.
Select * from books Order by Price Desc limit 1;

-- 7). SHOW ALL CUSTOMER WHO ORDERED MORE THEN 1 QUANTITY OF A BOOK.
Select * from orders
where Quantity > 1;



