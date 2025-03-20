USE madangdb;
delimiter //
CREATE PROCEDURE BookInsertOrUpdate(
	mybookid    INTEGER,
    mybookname  VARCHAR(40),
    mypublisher VARCHAR(40),
    myprice	    INTEGER)
BEGIN
	DECLARE mycount INTEGER;
    SELECT  COUNT(*) INTO mycount 
    FROM    Book
    WHERE   bookname LIKE mybookname;
	IF mycount != 0 THEN
		SET SQL_SAFE_UPDATES = 0;
        UPDATE Book SET price = myprice
			WHERE bookname LIKE mybookname;
	ELSE
		INSERT INTO Book(bookid, bookname, publisher, price)
		   VALUES(mybookid, mybookname, mypublisher, myprice);
	END IF;
END;
//
delimiter ;

-- BookInertOrUpdate 프로시저 실행하여 테스트 하는 부분 (insert)
CALL BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 25000);
SELECT * FROM Book;

-- BookInertOrUpdate 프로시저 실행하여 테스트 하는 부분 (update)
CALL BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 20000);
SELECT * FROM Book;
    