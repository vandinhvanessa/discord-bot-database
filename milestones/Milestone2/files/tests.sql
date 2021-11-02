-- Script name: tests.sql
-- Author: Vanessa Van Dinh
-- Purpose: test the integrity of this database system

-- the database used to insert the data into.
USE OnlineAppointmentDB;
SET SQL_SAFE_UPDATES = 0;


-- Testing Device Table
DELETE FROM Device WHERE device_id = 4;
UPDATE Device SET device_type = 'Windows' WHERE device_id = 1;

-- Testing Permissions Table
DELETE FROM Permissions WHERE permission_id = 2;
UPDATE Permissions SET permission_flag = 0 WHERE permission_id = 3;

-- Testing Account_Type_Permissions Table
DELETE FROM Account_Type_Permissions WHERE account_type_id = 2;
UPDATE Account_Type_Permissions SET acc_type_patient_id = null;

-- Testing Patient Table
DELETE FROM Patient WHERE patient_id = 1;
UPDATE Patient SET patient_phone_number = '408-123-4567' WHERE patient_id = 2;

-- Testing Testing_Service Table
DELETE FROM Testing_Service WHERE testing_service_id = 1;
UPDATE Testing_Service SET testing_service_time = '11:30:00' WHERE testing_service_id = 2;

-- Testing General_User Table
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`onlineappointmentdb`.`testing_service`, CONSTRAINT `TESTING_PATIENT_FK` FOREIGN KEY (`testing_service_patient`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE)
DELETE FROM General_User WHERE user_id = 3;
UPDATE General_User SET user_last_name = 'Tran' WHERE user_id = 1;

-- Testing Patient_Address Table
DELETE FROM Patient_Address WHERE patient_add_id = 3;
UPDATE Patient_Address SET patient_city = 'San Mateo' WHERE patient_add_id = 1;
 
-- Testing Sessions Table
DELETE FROM Sessions WHERE session_id = 5;
UPDATE Sessions SET session_expire = '2021-11-1 12:00:00' WHERE session_id = 6;

-- Testing Accounts Table
DELETE FROM Accounts WHERE account_id = 4;
UPDATE Accounts SET account_email = 'gummybears99@yahoo.com' WHERE account_id = 1;


-- Testing Patient_Account Table
DELETE FROM Patient_Account WHERE patient_account_id = 3;
UPDATE Patient_Account SET patient_description = 'This is a new patient at HHMF.' WHERE patient_account_id = 2;

-- Testing Employee_Account Table
DELETE FROM Employee_Account WHERE employee_account_id = 4;
UPDATE Employee_Account SET employee_account_type = 'HEALTHCARE PROVIDER' WHERE employee_account_id = 7;

-- 10. Testing Account_Profile Table
DELETE FROM Account_Profile WHERE profile_id = 5555;
UPDATE Account_Profile SET profile_pronouns = 'He/His' WHERE profile_id = 8888;

-- Testing Payment_Type Table
DELETE FROM Payment_Type WHERE payment_type_id = 8;
UPDATE Payment_Type SET billing_address = '1930 Grapevine Lane' WHERE payment_type_id = 1;

-- Testing Actions Table
DELETE FROM Actions WHERE action_id = 1;
UPDATE Actions SET action_type = 'RESCHEDULE APPOINTMENT.' WHERE action_id = 3;

-- Testing Billing Table
DELETE FROM Billing WHERE billing_id = 1;
UPDATE Billing SET billing_date = '2021-02-20' WHERE billing_id = 2;

-- Testing Bank_Account Table
DELETE FROM Bank_Account WHERE bank_account_id = 4;
UPDATE Bank_Account SET bank_code = '8080' WHERE bank_account_id = 5;

-- Testing Checking Table
DELETE FROM Checking WHERE checking_routing_number = 194748254;
UPDATE Checking SET checking_type = 'STUDENT' WHERE checking_routing_number = 388264616;

-- Testing Savings Table
DELETE FROM Saving WHERE saving_routing_number = 113983903;
UPDATE Saving SET saving_type = 'STUDENT' WHERE saving_routing_number = 337370127;

-- Testing Insurance_Company Table
DELETE FROM Insurance_Company WHERE insurance_company_id = 1;
UPDATE Insurance_Company SET insurance_deductible = 600.00 WHERE insurance_company_id = 3;

-- Testing Insurance Plan Table
DELETE FROM Insurance_Plan WHERE insurance_id = 128359690;
UPDATE Insurance_Plan SET insurance_expire_date = '2026-04-22';

-- Testing Department Table
DELETE FROM Department WHERE department_id = 11111;
UPDATE Department SET department_phone_number = '408-573-6853' WHERE department_id = 22222;

-- Testing Employee_Address Table
DELETE FROM Employee_Address WHERE employee_add_id = 10;
UPDATE Employee_Address SET employee_address = '7584 Lily Way' WHERE employee_add_id = 11;

-- Testing Employee Table
DELETE FROM Employee WHERE employee_id = 7;
UPDATE Employee SET employee_salary = 150000.00 WHERE employee_id = 8;

-- Testing Employee_Department Table
DELETE FROM Employee_Department WHERE employeeID = 9;
UPDATE Employee_Department SET departmentID = 22222 WHERE employeeID = 10;

-- Testing Healthcare_Provider Table
DELETE FROM Healthcare_Provider WHERE hcp_id = 1;
UPDATE Healthcare_Provider SET hcp_specialization_pos = 'ONCOLOGY' WHERE hcp_id = 3;

-- Testing Nurse Table
DELETE FROM Nurse WHERE nurse_id = 1;
UPDATE Nurse SET nurse_type = 'CERTIFIED NURSING ASSISTANT' WHERE nurse_id = 2;

-- Testing Receptionist Table
DELETE FROM Receptionist WHERE reception_id = 1;
UPDATE Receptionist SET reception_id = 4 WHERE reception_id = 3;

-- Testing Location Table
DELETE FROM Location WHERE location_id = 1;
UPDATE Location SET location_address = '3852 Strawberry Lane' WHERE location_id = 2;

-- Testing Clinic Table
DELETE FROM Clinic WHERE clinic_id = 1;
UPDATE Clinic SET clinic_phone_number = '408-468-2685' WHERE clinic_id = 3;

-- Testing Clinic_Workers;
DELETE FROM Clinic_Workers WHERE clinic_place_id = 1;
UPDATE Clinic_Workers SET clinic_hcp_id = null;

-- Testing Procedure_Operation Table
DELETE FROM Procedure_Operation WHERE procedure_id = 1;
UPDATE Procedure_Operation SET procedure_time = '11:30:00' WHERE procedure_id = 3;

-- Testing Treatment_Plan
DELETE FROM Treatment_Plan WHERE treatment_id = 1;
UPDATE Treatment_Plan SET treatment_procedure = 1 WHERE treatment_id = 2;

-- Testing Medicine Table
DELETE FROM Medicine WHERE medicine_id = 1;
UPDATE Medicine SET medicine_name = 'PENICILLIN' WHERE medicine_id = 2;

-- Testing Prescription Table
DELETE FROM Prescription WHERE prescription_id = 1;
UPDATE Prescription SET prescription_patient = 3 WHERE prescription_id = 2;

-- Testing Pharmaceutical_Company Table
DELETE FROM Pharmaceutical_Company WHERE pharmaceutical_id = 1;
UPDATE Pharmaceutical_Company SET pharmaceutical_phone_number = '408-247-8642' WHERE pharmaceutical_id = 2;

-- Testing Pharmacy Table
DELETE FROM Pharmacy WHERE pharmacy_id = 1;
UPDATE Pharmacy SET pharmacy_address = '3572 Pineapple Drive, San Francisco, CA 95121' WHERE pharmacy_id = 2;

-- Testing Manufacturing Table 
DELETE FROM Manufacturing WHERE manufacture_id = 1;
UPDATE Manufacturing SET med_id = 2 WHERE manufacture_id = 3;

-- Testing Contract Table
DELETE FROM Contract WHERE contract_id = 1;
UPDATE Contract SET contract_end_date = '2026-03-12' WHERE contract_id = 3;

-- Testing Pharmacy_Sales Table
DELETE FROM Pharmacy_Sales WHERE sales_id = 1;
UPDATE Pharmacy_Sales SET sale_product_quantity = 30 WHERE sales_id = 2;

-- Testing Calendar_Date Table
DELETE FROM Calendar_Date WHERE calendar_date = '2021-10-10';
UPDATE Calendar_Date SET calendar_date = '2021-11-05' WHERE calendar_date = '2021-10-20';

-- Testing Calendar_Time Table
DELETE FROM Calendar_Time WHERE time_schedule = '12:30:00';
UPDATE Calendar_Time SET time_schedule = '08:00:00' WHERE time_schedule = '10:00:00';

-- Testing Appointment Table
DELETE FROM Appointment WHERE appt_id = 1; 
UPDATE Appointment SET appt_date = '2021-11-05' WHERE appt_id = 3;



