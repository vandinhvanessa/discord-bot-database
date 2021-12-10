USE OnlineAppointmentDB;

-- For TRIGGER #1
SELECT * FROM Pharmacy_Sales;

-- For TRIGGER #2
SELECT * FROM Treatment_Plan;

-- For Procedure
CALL treatment_select(1);

-- For Function
SELECT employee_name, EmployeeStatus(employee_salary) AS 'Employee Status' FROM Employee ORDER BY employee_name;




