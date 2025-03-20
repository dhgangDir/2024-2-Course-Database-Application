
-- Replace highorders
CREATE OR REPLACE VIEW highorders (bookid, bookname, name, publisher)
AS 	SELECT	bk.bookid, bk.bookname, cs.name, bk.publisher
	FROM	Book bk, Orders od, Customer cs
    WHERE	bk.bookid = od.bookid 
			AND od.custid = cs.custid;

-- Check view    
SELECT  *
FROM	highorders;