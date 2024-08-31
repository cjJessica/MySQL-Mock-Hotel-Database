-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'customers'
-- 
-- ---

DROP TABLE IF EXISTS `customers`;
		
CREATE TABLE `customers` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstN` VARCHAR(30) NULL DEFAULT NULL,
  `lastN` VARCHAR(30) NULL DEFAULT NULL,
  `phone_num` CHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---
-- Table 'room_info'
-- 
-- ---

DROP TABLE IF EXISTS `room_info`;
		
CREATE TABLE `room_info` (
  `room_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `room_num` INTEGER NULL DEFAULT NULL,
  `floor_num` INTEGER NULL DEFAULT NULL,
  `suite_type` VARCHAR(25) NULL DEFAULT NULL,
  `availability` VARCHAR(15) NULL DEFAULT NULL,
  `cost` DECIMAL(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`room_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---
-- Table 'employees'
-- 
-- ---

DROP TABLE IF EXISTS `employees`;
		
CREATE TABLE `employees` (
  `employee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_firstN` VARCHAR(30) NULL DEFAULT NULL,
  `employee_lastN` VARCHAR(30) NULL DEFAULT NULL,
  `work_days` VARCHAR(150) NULL DEFAULT NULL,
  `position_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`employee_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---
-- Table 'employee_position'
-- 
-- ---

DROP TABLE IF EXISTS `employee_position`;
		
CREATE TABLE `employee_position` (
  `position_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_title` VARCHAR(150) NULL DEFAULT NULL,
  `position_salary` DECIMAL(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`position_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---
-- Table 'visit'
-- 
-- ---

DROP TABLE IF EXISTS `visit`;
		
CREATE TABLE `visit` (
  `visit_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` INT UNSIGNED NOT NULL,
  `customer_id` INT UNSIGNED NOT NULL,
  `room_id` INT UNSIGNED NOT NULL,
  `checkIn_date` DATE NULL DEFAULT NULL,
  `checkOut_date` DATE NULL DEFAULT NULL,
  `num_of_days` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`visit_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---
-- Table 'roomService_tab'
-- 
-- ---

DROP TABLE IF EXISTS `roomService_tab`;
		
CREATE TABLE `roomService_tab` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_ordered` DATE NULL DEFAULT NULL,
  `visit_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---
-- Table 'roomService_meals'
-- 
-- ---

DROP TABLE IF EXISTS `roomService_meals`;
		
CREATE TABLE `roomService_meals` (
  `meal_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `meal_name` VARCHAR(100) NULL DEFAULT NULL,
  `price` DECIMAL(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`meal_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---
-- Table 'roomService_tab_meals'
-- 
-- ---

DROP TABLE IF EXISTS `roomService_tab_meals`;
		
CREATE TABLE `roomService_tab_meals` (
  `meal_id` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL,
  `quantity` INTEGER NULL DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `employees` ADD FOREIGN KEY (position_id) REFERENCES `employee_position` (`position_id`);
ALTER TABLE `visit` ADD FOREIGN KEY (employee_id) REFERENCES `employees` (`employee_id`);
ALTER TABLE `visit` ADD FOREIGN KEY (customer_id) REFERENCES `customers` (`customer_id`);
ALTER TABLE `visit` ADD FOREIGN KEY (room_id) REFERENCES `room_info` (`room_id`);
ALTER TABLE `roomService_tab` ADD FOREIGN KEY (visit_id) REFERENCES `visit` (`visit_id`);
ALTER TABLE `roomService_tab_meals` ADD FOREIGN KEY (meal_id) REFERENCES `roomService_meals` (`meal_id`);
ALTER TABLE `roomService_tab_meals` ADD FOREIGN KEY (order_id) REFERENCES `roomService_tab` (`order_id`);


-- ---
-- Triggers
-- ---
delimiter $
CREATE TRIGGER room_num_checker BEFORE INSERT on room_info
FOR EACH ROW BEGIN
    IF NEW.room_num < 0 THEN
        signal SQLSTATE '45000' set MESSAGE_TEXT = "This hotel doesn't have room number that low";
    ELSEIF NEW.room_num > 300 THEN
        signal SQLSTATE '45000' set MESSAGE_TEXT = "This hotel doesn't have room number that high";
    END IF;
END$
delimiter ;

--insert into room_info(room_num) values (333);
--insert into room_info(room_num) values (-20);


delimiter $

CREATE TRIGGER visit_checker BEFORE INSERT on visit 
FOR EACH ROW BEGIN
    IF NEW.num_of_days < 0 THEN
        set NEW.num_of_days = 0;
    END IF;
END$

delimiter ;

