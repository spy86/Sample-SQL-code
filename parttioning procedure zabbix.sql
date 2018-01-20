

    DELIMITER //
    DROP PROCEDURE IF EXISTS `zabbix`.`create_zabbix_monthly_partitions` //
    CREATE PROCEDURE `zabbix`.`create_zabbix_monthly_partitions` ()
    BEGIN
    CALL zabbix.create_next_monthly_partitions("zabbix","acknowledges");
    CALL zabbix.create_next_monthly_partitions("zabbix","alerts");
    CALL zabbix.create_next_monthly_partitions("zabbix","auditlog");
    CALL zabbix.create_next_monthly_partitions("zabbix","events");
    CALL zabbix.create_next_monthly_partitions("zabbix","service_alarms");
    CALL zabbix.create_next_monthly_partitions("zabbix","trends");
    CALL zabbix.create_next_monthly_partitions("zabbix","trends_uint");
    CALL zabbix.drop_old_monthly_partitions("zabbix","acknowledges");
    CALL zabbix.drop_old_monthly_partitions("zabbix","alerts");
    CALL zabbix.drop_old_monthly_partitions("zabbix","auditlog");
    CALL zabbix.drop_old_monthly_partitions("zabbix","events");
    CALL zabbix.drop_old_monthly_partitions("zabbix","service_alarms");
    CALL zabbix.drop_old_monthly_partitions("zabbix","trends");
    CALL zabbix.drop_old_monthly_partitions("zabbix","trends_uint");
    END //
    DROP PROCEDURE IF EXISTS `zabbix`.`create_next_monthly_partitions` //
    CREATE PROCEDURE `zabbix`.`create_next_monthly_partitions` (SCHEMANAME varchar(64), TABLENAME varchar(64))
    BEGIN
    DECLARE NEXTCLOCK timestamp;
    DECLARE PARTITIONNAME varchar(16);
    DECLARE CLOCK int;
    SET @totalmonths = 3;
    SET @i = 1;
    createloop: LOOP
    SET NEXTCLOCK = DATE_ADD(NOW(),INTERVAL @i MONTH);
    SET PARTITIONNAME = DATE_FORMAT( NEXTCLOCK, 'p%Y%m' );
    SET CLOCK = UNIX_TIMESTAMP(DATE_FORMAT(DATE_ADD( NEXTCLOCK ,INTERVAL 1 MONTH),'%Y-%m-01 00:00:00'));
    CALL zabbix.create_partition( SCHEMANAME, TABLENAME, PARTITIONNAME, CLOCK );
    SET @i=@i+1;
    IF @i > @totalmonths THEN
    LEAVE createloop;
    END IF;
    END LOOP;
    END //
    DROP PROCEDURE IF EXISTS `zabbix`.`drop_old_monthly_partitions` //
    CREATE PROCEDURE `zabbix`.`drop_old_monthly_partitions` (SCHEMANAME varchar(64), TABLENAME varchar(64))
    BEGIN
    DECLARE OLDCLOCK timestamp;
    DECLARE PARTITIONNAME varchar(16);
    DECLARE CLOCK int;
    SET @minmonths = 12;
    SET @maxmonths = @minmonths+3;
    SET @i = @maxmonths;
    droploop: LOOP
    SET OLDCLOCK = DATE_SUB(NOW(),INTERVAL @i MONTH);
    SET PARTITIONNAME = DATE_FORMAT( OLDCLOCK, 'p%Y%m' );
    CALL zabbix.drop_partition( SCHEMANAME, TABLENAME, PARTITIONNAME );
    SET @i=@i-1;
    IF @i <= @minmonths THEN
    LEAVE droploop;
    END IF;
    END LOOP;
    END //
    DELIMITER ;

