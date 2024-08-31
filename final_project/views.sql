--For the first view, the professor helped make this. It will show the available rooms

--View 1
SELECT * FROM
(SELECT MAX(v.checkOut_date) as last_checkout, r.room_id, r.room_num
FROM visit v JOIN room_info r ON (v.room_id = r.room_id)
GROUP BY r.room_id) as t
WHERE t.last_checkout <  NOW();


--This view will list the meals and the quantity ordered

--View 2
CREATE algorithm = temptable view popular_meals AS 
SELECT rm.meal_name, rtm.quantity 
FROM roomService_meals AS rm JOIN roomService_tab_meals rtm ON (rm.meal_id=rtm.meal_id)
GROUP BY rtm.quantity;	

SELECT * FROM popular_meals;