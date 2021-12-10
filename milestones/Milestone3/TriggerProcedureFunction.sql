USE OnlineAppointmentDB;

-- This TRIGGER inserts a new Pharmacy_Sales record if the Medicine expire date is null, and sets the price to zero
DELIMITER $$ 
CREATE TRIGGER after_Medicine_Insert AFTER INSERT ON Medicine
FOR EACH ROW 
	BEGIN
 		IF NEW.expire_date IS NULL THEN
 			INSERT INTO Pharmacy_Sales(sales_id, sale_medicine_id, sale_pharmacy_id, sale_product_quantity, sale_medicine_price)
 			VALUES (NEW.medicine_id, NEW.medicine_id, 1, 0, 00.00);
 		END IF;
    END$$
DELIMITER ;

-- This TRIGGER inserts a new Treatment_Plan record if the Procedure time is null, sets sign_off to zero
-- meaning that the Procedure is no longer in service
DELIMITER $$
CREATE TRIGGER after_procedure_insert AFTER INSERT ON Procedure_Operation
FOR EACH ROW
	BEGIN
 		IF NEW.procedure_time IS NULL THEN
 			INSERT INTO Treatment_Plan(treatment_id, treatment_hcp, treatment_procedure, treatment_patient, treatment_description, treatment_sign_off) 
             VALUES(NEW.procedure_id, 1, NEW.procedure_id, 1, 'PROCEDURE NOT IN SERVICE', 0);
 		END IF;
 	END$$
DELIMITER ;
			
-- This PROCEDURE returns all the Treatment_Plans given the sign_off = 1 or 0
DELIMITER $$
CREATE PROCEDURE treatment_select (IN is_even TINYINT)
 	BEGIN
 		IF is_even = 1 THEN
 			SELECT * FROM Treatment_Plan WHERE treatment_sign_off = is_even;
		END IF;
        
	END $$
DELIMITER ;

-- This Function returns the status of employees
DELIMITER $$
CREATE FUNCTION EmployeeStatus(salary DECIMAL(10)) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	DECLARE employeeStatus VARCHAR(50);
    
    IF salary > 150000.00 THEN
		SET employeeStatus = 'HIGH STATUS';
	ELSEIF (salary < 150000.00 AND salary > 90000.00) THEN
		SET employeeStatus = 'MIDDLE STATUS';
	ELSEIF salary < 90000.00 THEN
		SET employeeStatus = 'LOW STATUS';
	END IF;
        RETURN (employeeStatus);
END $$
DELIMITER ;
        

