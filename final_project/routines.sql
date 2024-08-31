--First Function
delimiter $
CREATE FUNCTION total_for_order2(order_idf INT, meal_idf INT)
RETURNS FLOAT
READS SQL DATA
BEGIN
    set @amt = NULL;
    set @pricef = NULL;
    set @total_price = NULL;
	
    select quantity INTO @amt from roomService_tab_meals
    WHERE order_id = order_idf;

    select price INTO @pricef from roomService_meals
    WHERE meal_id = meal_idf;

    select @amt * @pricef INTO @total_price;
    return @total_price;
END $
delimiter ;

--Second function
delimiter $
CREATE FUNCTION customer_tab(fnamef CHAR(30), lnamef CHAR(30))
RETURNS FLOAT
READS SQL DATA
BEGIN

	SET @order_idf = NULL;
	SET @meal_idf = NULL;
	SET @total = NULL;

	SELECT order_id INTO @order_idf FROM roomService_tab WHERE visit_id =
	(SELECT visit_id FROM visit WHERE customer_id =
	(SELECT customer_id FROM customers WHERE firstN = fnamef AND lastN = lnamef));
	
	SELECT meal_id INTO @meal_idf FROM roomService_tab_meals WHERE order_id = @order_idf;
	
	SELECT total_for_order2(@order_idf, @meal_idf) INTO @total;
	return @total;
	
END $
delimiter ;

-- tests function 2
SELECT customer_tab("Jo", "Ker");


--Procedure 1
delimiter $
create procedure addvisit(e_fname VARCHAR(30), e_lname VARCHAR(30), c_fname VARCHAR(30), c_lname VARCHAR(30), vroom_num INT, checkIn_date DATE, checkOut_date DATE)
BEGIN
INSERT INTO visit(employee_id, customer_id, room_id, checkIn_date, checkOut_date, num_of_days) VALUES
((SELECT employee_id FROM employees WHERE employee_firstN = e_fname AND employee_lastN = e_lname), (SELECT customer_id FROM customers WHERE firstN = c_fname AND lastN = c_lname), (SELECT room_id FROM room_info WHERE availability = 'y' AND room_num = vroom_num), checkIn_date, checkOut_date, (DATEDIFF(checkOut_date, checkIn_date)));
END  $
delimiter ;

--Test procedure 1
CALL addvisit("Hal", "Jordan", "Than", "Os", 204, '2024-05-03', '2024-08-20');



--Second procedure
delimiter $
create procedure update_rooms_availability(uroom_id INT)
BEGIN
UPDATE room_info
SET availability = "n"
WHERE room_id = uroom_id AND (SELECT checkOut_date FROM visit WHERE room_id = uroom_id) > NOW() AND (SELECT checkIn_date FROM visit WHERE room_id = uroom_id) < NOW() ;

UPDATE room_info
SET availability = "y"
WHERE room_id = uroom_id AND (((SELECT checkOut_date FROM visit WHERE room_id = uroom_id) < NOW() AND (SELECT checkIn_date FROM visit WHERE room_id = uroom_id) < NOW()) OR ((SELECT checkOut_date FROM visit WHERE room_id = uroom_id) > NOW() AND (SELECT checkIn_date FROM visit WHERE room_id = uroom_id) > NOW()));

END  $
delimiter ;


--Test Procedure 2
CALL update_rooms_availability(15);



-- The 3rd procedure
delimiter $
create procedure test_event3()
BEGIN

CALL update_rooms_availability(1);
CALL update_rooms_availability(2);
CALL update_rooms_availability(3);
CALL update_rooms_availability(4);
CALL update_rooms_availability(5);
CALL update_rooms_availability(6);
CALL update_rooms_availability(7);
CALL update_rooms_availability(8);
CALL update_rooms_availability(9);
CALL update_rooms_availability(10);
CALL update_rooms_availability(11);
CALL update_rooms_availability(12);
CALL update_rooms_availability(13);
CALL update_rooms_availability(14);
CALL update_rooms_availability(15);


END  $
delimiter ;

--Test procedure 3
--CALL test_event3()




