-- Procedures are compiled functions

USE `playground`;

DROP PROCEDURE IF EXISTS `PREPARE_ENVIRONMENT`;

DELIMITER ;;
CREATE PROCEDURE `PREPARE_ENVIRONMENT` ()
BEGIN
	DROP DATABASE IF EXISTS `playground`;
	CREATE DATABASE `playground`;
	CREATE TABLE `playground`.`person` (
		`name` NVARCHAR(80) NOT NULL,
		`salary` FLOAT DEFAULT NULL,
		`age` INT NOT NULL,
		`occupation` NVARCHAR(80) NOT NULL,
		`gender` VARCHAR(6) NOT NULL,
		`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	);
END ;;
DELIMITER ;

CALL PREPARE_ENVIRONMENT();

/*
SQL Server compatibility:

AUTO_INCREMENT = IDENTITY(1,1)
`name` = [name]
*/
