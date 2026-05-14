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

--8). RETRIEVE ALL ORDERS WHERE THE TOTAL AMOUNT EXCEEDS $20.
Select * from orders
where total_amount > 20;

-- 9). LIST ALL THE GENRES AVAILABLE IN THE BOOKS TABLES
Select DISTINCT genre from books;

-- 10). FIND THE BOOK WITH THE LOWEST STOCK
select * from Books
order by stock;

-- 11). CALCULATE THE TOTAL REVENUE GENERATED FROM ALL ORDERS
Select sum(total_amount) as TOTAL_Revenue from orders;


-

  ---------##### ADVANCED QUESTION :



-- 12). RETRIEVE THE TOTAL NUMBER OF BOOKS SOLD FOR EACH GENRE
Select books.Genre, sum(orders.quantity) as Total_books_sold 
From orders join Books 
on orders.book_id = books.book_id
Group by books.Genre;

-- 13). FIND THE AVERAGE PRICE OF BOOKS IN THE "FANTASY" GENERE.
Select Avg(price) as Average_price
from books
where genre = 'Fantasy';

-- 14). LIST CUSTOMERS WHO HAVE PLACED AT LEAST 2 ORDERS
Select orders.customer_id, customers.name, count(orders.order_id) as Order_Count 
from orders
join customers on orders.customer_id = customers.customer_id
group by orders.Customer_id, customers.name
having count(order_id) >=2;

--15). FIND THE MOST FREQUENTLY ORDERED BOOK 
select orders.Book_id, books.title, Count(orders.order_id) as order_count
from orders
join books on orders.book_id = Books.book_id
group by orders.Book_id, books.title
order by Order_count desc;

-- 16). SHOW THE TOP 3 MOST EXPENSIVE BOOKS OF 'FANTASY' GENRE
select * from Books
where genre ='Fantasy'
order by price desc limit 3;


