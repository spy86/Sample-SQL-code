delimiter //

CREATE PROCEDURE history()
  BEGIN
  SET @x = 10000;
  REPEAT
	delete from history where clock < 1388534400 limit 10000;
	SET @x = row_count();
	SELECT @x;
	SELECT SLEEP(2);
  UNTIL @x <> 10000 
  END REPEAT;
 END
//
delimiter ;

delimiter //

CREATE PROCEDURE history_str()
  BEGIN
  SET @x = 10000;
  REPEAT
	delete from history_str where clock < 1388534400 limit 10000;
	SET @x = row_count();
	SELECT @x;
	SELECT SLEEP(2);
  UNTIL @x <> 10000 
  END REPEAT;
 END
//
delimiter ;

delimiter //

CREATE PROCEDURE history_str_sync()
  BEGIN
  SET @x = 10000;
  REPEAT
	delete from history_str_sync where clock < 1388534400 limit 10000;
	SET @x = row_count();
	SELECT @x;
	SELECT SLEEP(2);
  UNTIL @x <> 10000 
  END REPEAT;
 END
//
delimiter ;

delimiter //

CREATE PROCEDURE history_sync()
  BEGIN
  SET @x = 10000;
  REPEAT
	delete from history_sync where clock < 1388534400 limit 10000;
	SET @x = row_count();
	SELECT @x;
	SELECT SLEEP(2);
  UNTIL @x <> 10000 
  END REPEAT;
 END
//
delimiter ;

delimiter //

CREATE PROCEDURE history_uint()
  BEGIN
  SET @x = 10000;
  REPEAT
	delete from history_uint where clock < 1388534400 limit 10000;
	SET @x = row_count();
	SELECT @x;
	SELECT SLEEP(2);
  UNTIL @x <> 50000 
  END REPEAT;
 END
//
delimiter ;

delimiter //

CREATE PROCEDURE history_text()
  BEGIN
  SET @x = 10000;
  REPEAT
	delete from history_text where clock < 1388534400 limit 10000;
	SET @x = row_count();
	SELECT @x;
	SELECT SLEEP(2);
  UNTIL @x <> 10000 
  END REPEAT;
 END
//
delimiter ;

delimiter //

CREATE PROCEDURE history_uint_sync()
  BEGIN
  SET @x = 10000;
  REPEAT
	delete from history_uint_sync where clock < 1388534400 limit 10000;
	SET @x = row_count();
	SELECT @x;
	SELECT SLEEP(2);
  UNTIL @x <> 10000 
  END REPEAT;
 END
//
delimiter ;