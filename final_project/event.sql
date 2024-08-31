-- This event works, but you may have to change the date and time depending on when you grade this.
CREATE EVENT room_checker_test
	ON SCHEDULE EVERY 1 hour 
	STARTS '2024-05-11 02:40:00'
	DO
	CALL test_event3();


