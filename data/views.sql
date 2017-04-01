-- Views are used to create a determined view of a table

USE `playground`;

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
	`name` NVARCHAR(80) NOT NULL,
	`salary` FLOAT DEFAULT NULL,
	`age` INT NOT NULL,
	`occupation` NVARCHAR(80) NOT NULL,
	`gender` VARCHAR(6) NOT NULL,
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

INSERT INTO `person`
	(`name`, `salary`, `age`, `occupation`, `gender`)
VALUES
	('John', 10, 20, 'student', 'male'),
	('Doe', 20, 30, 'developer', 'male'),
	('Maria', 30, 40, 'dba', 'female'),
	('Ana', 40, 50, 'student', 'female'); 
-- populates table

DROP VIEW IF EXISTS `vw_student`;

CREATE VIEW `vw_student` AS
SELECT
	`name`,
	`age`,
	`gender`
FROM playground.person
WHERE
	1 = 1
	AND occupation = 'student';
-- creates a view of students

SELECT
	COUNT(1) AS 'count'
FROM vw_student
WHERE
	1 = 1
	AND gender = 'female';
-- should be 1

/*
SQL Server compatibility:

AUTO_INCREMENT = IDENTITY(1,1)
`name` = [name]
*/
