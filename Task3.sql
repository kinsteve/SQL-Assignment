-------TASK 3-----------
--1--
select OrderId,OrderDate,TotalAmount,
o.CustomerId,CONCAT(FirstName,' ',LastName) Name , Phone
from Orders o JOIN Customers c
on o.CustomerId = c.CustomerId;
------------------------------------------------------------

--2--
select p.ProductId, ProductName, COALESCE(sum(Quantity*Price),0) TotalRevenueByProduct
from Products p left join OrderDetails od
on p.ProductId = od.ProductId
Group by p.ProductId,ProductName;
-----------------------------------------------------------------

--3--
select c.CustomerId ,CONCAT(FirstName,' ',LastName) Name ,Email,Phone
from Customers c join Orders o
On  c.CustomerId = o.CustomerId
group by c.CustomerId , CONCAT(FirstName,' ',LastName),Email,Phone
Having count(*) > 0;

---Alternative-----
select CustomerId,CONCAT(FirstName,' ',LastName) Name,Email,Phone
from Customers
where TotalOrdersPlaced>0;
---------------------------------------------------------------------

--4--

WITH ProductOrderTotals AS (
    SELECT p.ProductId, p.ProductName, 
           COALESCE(SUM(od.Quantity), 0) AS TotalQuantityOrdered
    FROM Products p
    LEFT JOIN OrderDetails od ON p.ProductId = od.ProductId
    GROUP BY p.ProductId, p.ProductName
)
SELECT ProductId, ProductName, TotalQuantityOrdered
FROM ProductOrderTotals
WHERE TotalQuantityOrdered = (
    SELECT MAX(TotalQuantityOrdered) 
    FROM ProductOrderTotals
);
--Explanation:
--Common Table Expression (CTE): The WITH clause calculates the total quantity ordered for each product.
--Subquery: The subquery inside the WHERE clause finds the maximum TotalQuantityOrdered.
--Final Select: The main query selects all products where their TotalQuantityOrdered matches the maximum found in the subquery.
------------------------------------------------------------------------------------------

--5--

-- But there is no column called Categories or table of such sort

--------------------------------------------------------------------------------------

--6--
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS Name, 
       COALESCE(AVG(o.TotalAmount),0.0) AS [Average Order Value]
FROM Customers c
Left JOIN Orders o ON c.CustomerId = o.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName;

---------------------------------------------------------------------------------------

--7--
SELECT OrderId,CONCAT(c.FirstName,' ',c.LastName) as Name, Email, [Address],Phone 
,o.TotalAmount [Total Revenue]
from Orders o join Customers c
on o.CustomerId = c.CustomerId
Where o.TotalAmount=(
Select max(TotalAmount)
from Orders
);
----------------------------------------------------------------------------------

--8--
SELECT p.ProductId, ProductName, COALESCE(count(*),0) [Number of Times Ordered]
from Products p left join OrderDetails od
on p.ProductId = od.ProductId
group by p.ProductId,ProductName;
------------------------------------------------------------------------------------

--9--
DECLARE @ProductName varchar(20);
SET @ProductName =  'Drone';

select p.ProductId, p.ProductName , CONCAT(c.FirstName,' ',c.LastName) Name
from Products p left join OrderDetails od
on p.ProductId=od.ProductId
join Orders o 
on od.OrderId = o.OrderId
join Customers c
on o.CustomerId = c.CustomerId
where p.ProductName = @ProductName
group by p.ProductId, p.ProductName,CONCAT(c.FirstName,' ',c.LastName);
------------------------------------------------------------------------------------

--10--
DECLARE @StartDate Date;
DECLARE @EndDate Date;

SET @StartDate = '2024-03-01';
SET @EndDate = '2024-08-01';

select sum(TotalAmount) TotalRevenueGenerated FROM Orders
where OrderDate between @StartDate and @EndDate;