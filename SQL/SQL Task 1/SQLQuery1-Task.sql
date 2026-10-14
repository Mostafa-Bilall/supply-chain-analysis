use project_1
select *
from sales

--1-- Find Total Orders for each Customer
Select Distinct Customer_id ,Customer_Name ,
  Count ( order_id) #Orders
From sales
Group by Customer_id,Customer_Name

---2-Find Total Orders and total sales for each City , state and Category
Select Distinct City , State, Category, Region,
   Count(Order_id) #Orders , 
   Round( Sum (Sales),0) #Sales
From Sales
GROUP BY City , State , Category , Region

--3-- It’s the same query as the previous 
------but here I used WHERE to filter on any condition
------and I used ORDER BY to which city had the highest sales.  

Select Distinct City , State, Category, Region ,
   Count(Order_id) #Orders , 
   Round( Sum (Sales),0) #Sales
From Sales
 where Sales >= 500
GROUP BY City , State , Category ,Region
order by #Sales Desc

---4-- Find The top 10 selling products

select top 10 product_id , product_name ,
   Round (sum (sales),0) #Sales
from Sales
group by product_id , product_name
order by #Sales Desc

---5-- find the profit fot category and sub_category

select Category , Sub_Category ,
     Round ( SUM ( profit) , 2) as #profit
from Sales
group by Category , Sub_Category


--6-- Find the customer who costs the company the most (top 10)
Select Top 10 Customer_Name,
     SUM(Profit) AS #Profit
from Sales
GROUP BY Customer_Name
ORDER BY #Profit ASC;


--7-- Find the top selling products in New York City

Select Distinct product_name ,  Category, Region , City,
   Round( Sum (Quantity),0) #Quantity
From Sales
Where city = 'New York City'
GROUP BY product_name , Category , Region ,City
 having Round( Sum (Quantity),0) >= 15
order by #Quantity Desc

--8-- We can use it again to find the top product sell 
 
Select Distinct product_name ,  Category, Region , City,
   Round( Sum (Quantity),0) #Quantity
From Sales
GROUP BY product_name , Category , Region ,City
order by #Quantity Desc

---9--- Find Total sales for each Customer
Select Distinct Customer_id ,Customer_Name ,
     Round ( sum ( Sales) , 0)  #sales
From sales
Group by   Customer_id,Customer_Name 
order by #sales Desc

----10--- Find Total AVG sales for each Customer
Select Distinct Customer_id ,Customer_Name ,
     Round ( AVG ( Sales) , 0)  #AVG
From sales
Group by   Customer_id,Customer_Name 
order by #sales Desc

----11--- Find the total discount for each customer for each product
Select Distinct Customer_id ,Customer_Name , product_name ,
     Round ( sum ( Discount) , 2)  #Discount
From sales
Group by   Customer_id,Customer_Name ,product_name 
order by #Discount Desc

---12-- Find the total sales for each year
select  Year (Order_Date) as  #SalesYear,
    ROUND(SUM(Sales), 0) as #Sales
From Sales
Group by Year (Order_Date)

---13-- find the Customer having more than 5 different orders
select Customer_ID,Customer_Name,
  count (Distinct Order_iD) #order
from Sales
group by Customer_ID , Customer_Name
  having count (Distinct Order_iD ) > 5
order by #order DESC;
