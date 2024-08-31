SELECT c.firstN, c.lastN, r.room_num, r.floor_num, e.employee_firstN, e.employee_lastN
FROM customers c JOIN visit v ON (c.customer_id=v.customer_id)
JOIN room_info r ON (v.room_id=r.room_id)
JOIN employees e ON (v.employee_id=e.employee_id)
GROUP BY c.firstN, c.lastN;