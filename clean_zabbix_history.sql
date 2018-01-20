CREATE TABLE history_backup AS
      SELECT * FROM history WHERE clock > 1388534400;
 TRUNCATE history;
 LOCK TABLE history WRITE, history_backup WRITE;
 INSERT INTO history SELECT * FROM history_backup;
 UNLOCK TABLES;
 DROP TABLE history_backup;
 
'###########################################################'

CREATE TABLE history_log_backup AS
      SELECT * FROM history_log WHERE clock > 1388534400;
 TRUNCATE history_log;
 LOCK TABLE history_log WRITE, history_log_backup WRITE;
 INSERT INTO history_log SELECT * FROM history_log_backup;
 UNLOCK TABLES;
 DROP TABLE history_log_backup;
 
 '###########################################################'
 CREATE TABLE history_str_backup AS
      SELECT * FROM history_str WHERE clock > 1388534400;
 TRUNCATE history_str;						  
 LOCK TABLE history_str WRITE, history_str_backup WRITE;
 INSERT INTO history_str SELECT * FROM history_str_backup;
 UNLOCK TABLES;
 DROP TABLE history_str_backup;
 
'###########################################################'

CREATE TABLE history_str_sync_backup AS
      SELECT * FROM history_str_sync WHERE clock > 1388534400;
 TRUNCATE history_str_sync;
 LOCK TABLE history_str_sync WRITE, history_str_sync_backup WRITE;
 INSERT INTO history_str_sync SELECT * FROM history_str_sync_backup;
 UNLOCK TABLES;
 DROP TABLE history_str_sync_backup;
 
 '#########################################################'
 CREATE TABLE history_sync_backup AS
      SELECT * FROM history_sync WHERE clock > 1388534400;
 TRUNCATE history_sync;
 LOCK TABLE history_sync WRITE, history_sync_backup WRITE;
 INSERT INTO history_sync SELECT * FROM history_sync_backup;
 UNLOCK TABLES;
 DROP TABLE history_sync_backup;
 
'###########################################################'

CREATE TABLE history_uint_backup AS
      SELECT * FROM history_uint WHERE clock > 1388534400;
 TRUNCATE history_uint;
 LOCK TABLE history_uint WRITE, history_uint_backup WRITE;
 INSERT INTO history_uint SELECT * FROM history_uint_backup;
 UNLOCK TABLES;
 DROP TABLE history_uint_backup;
 
 '##########################################################'
 CREATE TABLE history_text_backup AS
      SELECT * FROM history_text WHERE clock > 1388534400;
 TRUNCATE history_text;
 LOCK TABLE history_text WRITE, history_text_backup WRITE;
 INSERT INTO history_text SELECT * FROM history_text_backup;
 UNLOCK TABLES;
 DROP TABLE history_text_backup;
 
'###########################################################'

CREATE TABLE history_uint_sync_backup AS
      SELECT * FROM history_uint_sync WHERE clock > 1388534400;
 TRUNCATE history_uint_sync;
 LOCK TABLE history_uint_sync WRITE, history_uint_sync_backup WRITE;
 INSERT INTO history_uint_sync SELECT * FROM history_uint_sync_backup;
 UNLOCK TABLES;
 DROP TABLE history_uint_sync_backup;