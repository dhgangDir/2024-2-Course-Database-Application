SELECT * FROM Book;
SELECT * FROM Orders;
SELECT * FROM Customer;

DROP VIEW highorders;

-- Create view
CREATE VIEW	highorders (bookid, bookname, name, publisher, price)
AS 	SELECT	bk.bookid, bk.bookname, cs.name, bk.publisher, bk.price
	FROM	Book bk, Orders od, Customer cs
    WHERE	bk.bookid = od.bookid 
			AND od.custid = cs.custid
			AND bk.price = 20000;

-- Check view    
SELECT  *
FROM	highorders;