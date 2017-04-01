-- Triggers are store procedures that executes automatically

USE `playground`;

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
	`name` NVARCHAR(80) NOT NULL,
	`gross_amount` INT NOT NULL,
	`net_amount` INT NULL,
	`tax` NUMERIC(5,5) NOT NULL,
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

DROP TRIGGER IF EXISTS `net_amount_calculation`;

DELIMITER ;;
CREATE TRIGGER `net_amount_calculation`
BEFORE INSERT ON `playground`.`product`
	FOR EACH ROW
		BEGIN SET NEW.`net_amount` = NEW.`gross_amount` * (1 - NEW.`tax`);
END ;;
DELIMITER ;

INSERT INTO `product`
	(`name`, `gross_amount`, `tax`)
VALUES
	('soda', 100, 0.1),
	('pizza', 200, 0.2),
	('pasta', 70, 0.14);
-- populates table

SELECT
	`name`,
	`gross_amount`,
	`net_amount`
FROM playground.product;
-- as you can see, there are net_amount values
