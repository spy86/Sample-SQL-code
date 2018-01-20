DELIMITER $$
CREATE PROCEDURE delete_inc1()
BEGIN
REPEAT
START TRANSACTION;
DELETE FROM history
WHERE clock < 1388534400
 LIMIT 10000;
COMMIT;
UNTIL row_count() = 0
END REPEAT;
END $$
 
DELIMITER ;
CALL delete_inc1();