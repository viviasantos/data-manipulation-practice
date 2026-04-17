-- Multi tables Joins exercise

SELECT o.orderid,
       o.sales,
	   c.customerid,
	   c.firstName,
	   p.productid,
	   p.product,
	   e.employeeid,
	   e.firstname
FROM sales.orders AS o
LEFT JOIN sales.customers AS c
ON o.orderid = c.customerid

LEFT JOIN sales.products AS p
ON o.productid = p.productid

LEFT JOIN sales.employees e
ON o.salespersonid = e.employeeid;

