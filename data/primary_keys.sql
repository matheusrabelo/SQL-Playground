-- primary keys insure that none of the rows are duplicated

USE `playground`;

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
	`name` NVARCHAR(80) NOT NULL,
	`salary` FLOAT DEFAULT NULL,
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	-- primary key
);

INSERT INTO `playground`.`person`
	(`name`)
VALUES
	('John'),
	('John');
-- IN SQL Server, you can use GO N command, with N integer

SELECT
	`name`,
	`id`
FROM `playground`.`person`;
-- should be unique

/*
SQL Server compatibility:

AUTO_INCREMENT = IDENTITY(1,1)
`name` = [name]
*/
