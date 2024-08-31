


-- Inserts for Customers table
INSERT INTO `customers` 
(`firstN`,`lastN`,`phone_num`) VALUES
('Ven','Om','1234567890');

INSERT INTO `customers` 
(`firstN`,`lastN`,`phone_num`) VALUES
('Than','Os','1334363390');

INSERT INTO `customers` 
(`firstN`,`lastN`,`phone_num`) VALUES
('Doctor','Doom','1034567890'), ('Lex','Luther','2034567890');

INSERT INTO `customers` 
(`firstN`,`lastN`,`phone_num`) VALUES
('Dark','Seid','1004567890'), ('Jo','Ker','1000567890'),('Mag','Neto','1000667890'),('Rasal','Ghul','1000767890'),('Lo','Ki','1000867890'),('King','Pin','1000967890'),('Cat','Woman','1000167890'), ('Captain','Cold','100007890');


-- Inserts for room_info`
INSERT INTO `room_info` 
(`room_num`,`floor_num`,`suite_type`, `availability`, `cost`) VALUES
(101,1,'Penthouse', 'y', 800);

INSERT INTO `room_info` 
(`room_num`,`floor_num`,`suite_type`, `availability`, `cost`) VALUES
(204,2,'Penthouse', 'y', 800);

INSERT INTO `room_info` 
(`room_num`,`floor_num`,`suite_type`, `availability`, `cost`) VALUES
(110, 1, 'Family', 'n', 150), (201, 2, 'Standard', 'y', 90);

INSERT INTO `room_info` 
(`room_num`,`floor_num`,`suite_type`, `availability`, `cost`) VALUES
(209, 2, 'Family', 'y', 150), (102, 1, 'Standard', 'y', 90), (130, 1, 'Family', 'n', 150), (240, 2, 'Honeymoon', 'y', 300), (140, 1, 'Honeymoon', 'n', 300), (125, 1, 'Standard', 'y', 90), (225, 2, 'Family', 'y', 150), (212, 2, 'Standard', 'y', 90);

-- I added more rooms because I had more customers than I did AVAILABLE rooms
INSERT INTO `room_info` 
(`room_num`,`floor_num`,`suite_type`, `availability`, `cost`) VALUES
(244, 2, 'Family', 'y', 150), (144, 1, 'Standard', 'y', 90), (243, 2, 'Family', 'y', 150);

--Inserts for employee_position`
INSERT INTO `employee_position` 
(`position_title`,`position_salary`) VALUES
('Front Desk', 26000.00);

INSERT INTO `employee_position` 
(`position_title`,`position_salary`) VALUES
('Housekeeping', 27000.00), ('Security', 25428.80), ('Maitenance', 29000.20 ), ('Food and Beverage', 25000.80 ), ('Event Planning', 29900.00), ('Spa', 26000.00), ('Management', 39500.30 ), ('Concierge', 28050.00), ('Sales and Marketing', 33050.10);

--Inserts for employees
INSERT INTO `employees` 
(`employee_firstN`,`employee_lastN`,`work_days`,`position_id`) VALUES
('Super','Man','Mon-Fri',
(SELECT position_id FROM employee_position WHERE position_title = 'Housekeeping'));

INSERT INTO `employees` 
(`employee_firstN`,`employee_lastN`,`work_days`,`position_id`) VALUES
('Bat','Guy','Tues-Sat',
(SELECT position_id FROM employee_position WHERE position_title = 'Management')),
('Hal','Jordan','Mon-Fri',
(SELECT position_id FROM employee_position WHERE position_title = 'Front Desk')), 
('Captain','America','Wed-Sun',
(SELECT position_id FROM employee_position WHERE position_title = 'Security')),
('Dick','Grayson','Mon-Fri',
(SELECT position_id FROM employee_position WHERE position_title = 'Concierge')),
('Wally','West','Mon-Fri',
(SELECT position_id FROM employee_position WHERE position_title = 'Food and Beverage')),
('Tony','Stark','Tues-Sat',
(SELECT position_id FROM employee_position WHERE position_title = 'Maitenance')),
('Damian','Wayne','Tues-Sat',
(SELECT position_id FROM employee_position WHERE position_title = 'Spa')),
('Beast','Boy','Tues-Sat',
(SELECT position_id FROM employee_position WHERE position_title = 'Sales and Marketing')),
('Star','Fire','Tues-Sat',
(SELECT position_id FROM employee_position WHERE position_title = 'Event Planning'));


--Inserts for visit
INSERT INTO `visit` 
(`employee_id`,`customer_id`,`room_id`,`checkIn_date`,`checkOut_date`,`num_of_days`) VALUES
((SELECT employee_id FROM employees WHERE employee_firstN = 'Dick' AND employee_lastN = 'Grayson'),
(SELECT customer_id FROM customers WHERE firstN = 'King' AND lastN = 'Pin'), 
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 101),
'2024-02-09','2024-03-09', 29);


INSERT INTO `visit` 
(`employee_id`,`customer_id`,`room_id`,`checkIn_date`,`checkOut_date`,`num_of_days`) VALUES
((SELECT employee_id FROM employees WHERE employee_firstN = 'Hal' AND employee_lastN = 'Jordan'),
(SELECT customer_id FROM customers WHERE firstN = 'Rasal' AND lastN = 'Ghul'), 
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 209),
'2024-04-01','2024-04-09', 9);


INSERT INTO `visit` 
(`employee_id`,`customer_id`,`room_id`,`checkIn_date`,`checkOut_date`,`num_of_days`) VALUES
((SELECT employee_id FROM employees WHERE employee_firstN = 'Hal' AND employee_lastN = 'Jordan'),
(SELECT customer_id FROM customers WHERE firstN = 'Ven' AND lastN = 'Om'), 
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 102),
'2024-03-01','2024-03-04', 4);


INSERT INTO `visit` 
(`employee_id`,`customer_id`,`room_id`,`checkIn_date`,`checkOut_date`,`num_of_days`) VALUES
((SELECT employee_id FROM employees WHERE employee_firstN = 'Dick' AND employee_lastN = 'Grayson'),
(SELECT customer_id FROM customers WHERE firstN = 'Cat' AND lastN = 'Woman'), 
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 240),
'2024-05-01','2024-05-08', 8),

((SELECT employee_id FROM employees WHERE employee_firstN = 'Hal' AND employee_lastN = 'Jordan'),
(SELECT customer_id FROM customers WHERE firstN = 'Doctor' AND lastN = 'Doom'), 
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 125),
'2024-05-01','2024-05-03', 3),

((SELECT employee_id FROM employees WHERE employee_firstN = 'Hal' AND employee_lastN = 'Jordan'),
(SELECT customer_id FROM customers WHERE firstN = 'Lex' AND lastN = 'Luther'), 
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 225),
'2024-05-05','2024-05-10', 6),

((SELECT employee_id FROM employees WHERE employee_firstN = 'Dick' AND employee_lastN = 'Grayson'),
(SELECT customer_id FROM customers WHERE firstN = 'Dark' AND lastN = 'Seid'), 
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 144),
'2024-06-02','2024-06-10', 11), 

((SELECT employee_id FROM employees WHERE employee_firstN = 'Dick' AND employee_lastN = 'Grayson'),
(SELECT customer_id FROM customers WHERE firstN = 'Jo' AND lastN = 'Ker'), 
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 212),
'2024-05-31','2024-06-07', 8), 

((SELECT employee_id FROM employees WHERE employee_firstN = 'Hal' AND employee_lastN = 'Jordan'),
(SELECT customer_id FROM customers WHERE firstN = 'Mag' AND lastN = 'Neto'), 
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 243),
'2024-04-30','2024-05-30', 31),

((SELECT employee_id FROM employees WHERE employee_firstN = 'Hal' AND employee_lastN = 'Jordan'),
(SELECT customer_id FROM customers WHERE firstN = 'Lo' AND lastN = 'Ki'), 
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 244),
'2024-04-29','2024-05-08', 10),

((SELECT employee_id FROM employees WHERE employee_firstN = 'Dick' AND employee_lastN = 'Grayson'),
(SELECT customer_id FROM customers WHERE firstN = 'Captain' AND lastN = 'Cold'),
(SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = 201),
'2024-05-02','2024-05-29', 30);


-- Inserts for roomService_tab
INSERT INTO `roomService_tab` (`date_ordered`,`visit_id`) VALUES
('2024-05-04',(SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Captain' AND lastN = 'Cold')));

INSERT INTO `roomService_tab` (`date_ordered`,`visit_id`) VALUES
('2024-05-07',(SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Cat' AND lastN = 'Woman'))),
('2024-03-03',(SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'King' AND lastN = 'Pin'))),
('2024-04-30',(SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Lo' AND lastN = 'Ki'))),
('2024-04-08',(SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Rasal' AND lastN = 'Ghul'))),
('2024-05-29',(SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Mag' AND lastN = 'Neto'))),
('2024-06-05',(SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Jo' AND lastN = 'Ker'))),
('2024-06-09',(SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Dark' AND lastN = 'Seid'))),
('2024-05-08',(SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Lex' AND lastN = 'Luther'))),
('2024-05-02',(SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Doctor' AND lastN = 'Doom')));


--Inserts for roomService_meals
INSERT INTO `roomService_meals` (`meal_name`,`price`) VALUES
('Scrambled Eggs','7.50');

INSERT INTO `roomService_meals` (`meal_name`,`price`) VALUES
('Lobster','45.80'), ('Chicken Tenders','13.20'), ('Cheese Quesadilla','12.00'), ('Chicken Pot Pie','20.10'), ('Salad','10.00'), ('Sliders','18.90'), ('Ice Cream','5.25'), ('Fruit Cup','4.99'), ('Steak','30.60');


--Inserts for roomService_tab_meals
INSERT INTO `roomService_tab_meals` (`meal_id`,`order_id`,`quantity`) VALUES
((SELECT meal_id FROM roomService_meals WHERE meal_name = 'Lobster'),(SELECT order_id FROM roomService_tab WHERE visit_id = (SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Doctor' AND lastN = 'Doom'))), 2);


INSERT INTO `roomService_tab_meals` (`meal_id`,`order_id`,`quantity`) VALUES
((SELECT meal_id FROM roomService_meals WHERE meal_name = 'Steak'),(SELECT order_id FROM roomService_tab WHERE visit_id = (SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Lex' AND lastN = 'Luther'))), 1);

INSERT INTO `roomService_tab_meals` (`meal_id`,`order_id`,`quantity`) VALUES
((SELECT meal_id FROM roomService_meals WHERE meal_name = 'Chicken Pot Pie'),(SELECT order_id FROM roomService_tab WHERE visit_id = (SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Dark' AND lastN = 'Seid'))), 1),
((SELECT meal_id FROM roomService_meals WHERE meal_name = 'Fruit Cup'),(SELECT order_id FROM roomService_tab WHERE visit_id = (SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Jo' AND lastN = 'Ker'))), 3),
((SELECT meal_id FROM roomService_meals WHERE meal_name = 'Sliders'),(SELECT order_id FROM roomService_tab WHERE visit_id = (SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Mag' AND lastN = 'Neto'))), 3),
((SELECT meal_id FROM roomService_meals WHERE meal_name = 'Steak'),(SELECT order_id FROM roomService_tab WHERE visit_id = (SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Rasal' AND lastN = 'Ghul'))), 1),
((SELECT meal_id FROM roomService_meals WHERE meal_name = 'Salad'),(SELECT order_id FROM roomService_tab WHERE visit_id = (SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Lo' AND lastN = 'Ki'))), 5),
((SELECT meal_id FROM roomService_meals WHERE meal_name = 'Lobster'),(SELECT order_id FROM roomService_tab WHERE visit_id = (SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'King' AND lastN = 'Pin'))), 1),
((SELECT meal_id FROM roomService_meals WHERE meal_name = 'Scrambled Eggs'),(SELECT order_id FROM roomService_tab WHERE visit_id = (SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Cat' AND lastN = 'Woman'))), 2),
((SELECT meal_id FROM roomService_meals WHERE meal_name = 'Ice Cream'),(SELECT order_id FROM roomService_tab WHERE visit_id = (SELECT visit_id FROM visit WHERE customer_id = (SELECT customer_id FROM customers WHERE firstN = 'Captain' AND lastN = 'Cold'))), 21);


