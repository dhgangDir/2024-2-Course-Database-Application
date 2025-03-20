SELECT	*	FROM	Orders;
SELECT	*	FROM	Customer;

SELECT	 custid, (SELECT address
				  FROM	Customer cs
                  WHERE	cs.custid = od.custid) "address",
                  SUM(saleprice) "total"
FROM	 Orders od
GROUP BY od.custid