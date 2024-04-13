use products2;

SELECT oID, oDate, oTotalPrice FROM order_;

SELECT customer.cID, customer.cName, product.pID, product.pName
FROM customer
INNER JOIN order_ ON customer.cID = order_.cID
INNER JOIN orderdetail ON order_.oID = orderdetail.oID
INNER JOIN product ON orderdetail.pID = product.pID;

SELECT cID, cName FROM Customer WHERE cID NOT IN (SELECT DISTINCT cID FROM order_);

SELECT order_.oID, order_.oDate, SUM(orderdetail.odQty * product.pPrice) AS TotalPrice
FROM order_
INNER JOIN orderdetail ON order_.oID = orderdetail.oID
INNER JOIN product ON orderdetail.pID = product.pID
GROUP BY order_.oID, order_.oDate;

