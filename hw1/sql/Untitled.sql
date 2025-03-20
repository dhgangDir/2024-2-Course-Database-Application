SELECT * FROM Book;
SELECT * FROM Customer;

SELECT		custid, COUNT(*) AS 도서수량
FROM		Orders
WHERE		saleprice >= 8000
GROUP by	custid
HAVING		COUNT(*) >= 2