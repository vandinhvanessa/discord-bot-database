-- Script name: inserts.sql
-- Author: Vanessa Van Dinh
-- Purpose:     insert sample data to test the integrity of this database system
   
-- the database used to insert the data into.
USE OnlineAppointmentDB;

-- General User table inserts
 INSERT INTO General_User (user_id, user_name, user_last_name, user_email, user_phone_number, 
user_dob, user_address, is_reg_user) VALUES 
 (1, 'Vanessa', 'Van Dinh', 'monkiespancake@yahoo.com', '123-456-7890', '02/22/1999', '1234 Lane, San Jose, CA 12345', 1),
 (2, 'Victoria', 'Van Dinh', 'partyboba@yahoo.com', '908-765-4321', '08/11/1989', '4321 Drive, 4321 Drive, CA 4321 Drive', 1),
 (3, 'Steven', 'Van Dinh', 'drinkpeaches@yahoo.com', '111-222-3333', '03/25/1996', '6789 Avenue, San Jose, CA 22222', 1),
 
 (4, 'John', 'Smith', 'matchatea@yahoo.com', '126-286-2868', '05/19/1970', '9683 Lane, San Francisco, CA 19582', 1),
 (5, 'James', 'Williams', 'catbunny@yahoo.com', '596-285-8953', '07/21/1985', '3672 Court, Sunnyvale, CA 18636', 1),
 (6, 'Michael', 'Scott', 'alienship@yahoo.com', '196-856-3632', '08/07/1975', '8963 Way, San Jose, CA 95121', 1),
 
 (7, 'Bob', 'Edwards', 'pinkdrink@yahoo.com', '274-468-2467', '05/20/1982', '6462 White Court, San Jose, CA 92354', 1),
 (8, 'Amy', 'Tran', 'catandmouse@yahoo.com', '408-468-8645', '03/27/1996',  '3578 Green Lane, San Jose, CA 95123', 1),
 (9, 'Joe', 'Rogan', 'roejogan@yahoo.com', '560-346-5578', '05/25/1972', '4857 Money Drive, San Jose, CA 95136', 1),
 
 (10, 'Cathy', 'Lopez', 'macandcheese@yahoo.com', '496-285-6854', '06/22/1977', '2578 Madame Lane, San Jose, CA 49375', 1),
 (11, 'Harry', 'Potter', 'magicpotion@yahoo.com', '666-666-6666', '07/27/1989', '6666 Magic Way, San Jose, CA 84729', 1),
 (12, 'Jim', 'Halpert', 'tunacan@yahoo.com', '283-586-4836', '08/21/1985', '8832 Tuna Lane, San Jose, CA 96422', 1);
 
 -- Patient_Address table inserts
 INSERT INTO Patient_Address (patient_add_id, patient_address, patient_city, patient_state, patient_zipcode,
patient_country) VALUES 
(1, '1234 Lane','San Jose', 'California', '12345', 'USA'),
(2, '4321 Drive','4321 Drive', 'California', '4321 Drive', 'USA'),
(3, '6789 Avenue','San Jose', 'California', '22222', 'USA');

-- Patient table inserts
 INSERT INTO Patient (patient_id, patient_user_id, p_address_id, patient_name, patient_email, patient_phone_number,
 patient_dob) VALUES
 (1, 1, 1, 'Vanessa Van Dinh', 'monkiespancake@yahoo.com', '123-456-7890', '02/22/1999'),
 (2, 2, 2, 'Victoria Van Dinh', 'partyboba@yahoo.com', '908-765-4321', '08/11/1989'),
 (3, 3, 3, 'Steven Van Dinh', 'drinkpeaches@yahoo.com', '111-222-3333', '03/25/1996');

-- Payment_Type table inserts
INSERT INTO Payment_Type (payment_type_id, billing_address, billing_city, billing_state, billing_zipcode, billing_country) VALUES
(1, '4574 Avenue', 'San Jose', 'California', '95122', 'USA'),
(2, '6754 Drive', 'Milpits', 'California', '94352', 'USA'),
(3, '5685 Lane', 'Los Gatos', 'California', '46753', 'USA'),

(4, '9284 Way', 'Seattle', 'Washington', '29185', 'USA'),
(5, '3835 Court', 'Portland', 'Oregon', '29576', 'USA'),
(6, '1024 Boulevard', 'Santa Cruz', 'California', '26842', 'USA'),

(7, '6462 White Court', 'San Jose', 'California', '92354', 'USA'),
(8, '3578 Green Lane', 'San Jose', 'California', '95123', 'USA'),
(9, '4857 Money Drive', 'San Jose', 'California', '95136', 'USA'),

(10, '2578 Madame Lane', 'San Jose', 'California', '49375', 'USA'),
(11, '6666 Magic Way', 'San Jose', 'California', '84729', 'USA'),
(12, '8832 Tuna Lane', 'San Jose', 'California', '96422', 'USA');

-- Profile table inserts
INSERT INTO Account_Profile (profile_id, profile_pronouns, profile_picture) VALUES
(9999, 'She/Her', 'PICTURE'),
(8888, 'She/Her', 'PICTURE'),
(7777, 'He/His', 'PICTURE'),

(6666, 'He/His', 'PICTURE'),
(5555, 'He/His', 'PICTURE'),
(4444, 'He/His', 'PICTURE'),

(3333, 'He/His', 'PICTURE'),
(2222, 'He/His', 'PICTURE'),
(1111, 'He/His', 'PICTURE'),

(1109, 'He/His', 'PICTURE'),
(1108, 'He/His', 'PICTURE'),
(1107, 'He/His', 'PICTURE');

-- Account table inserts
INSERT INTO Accounts (account_id, account_user_id, account_profile, account_payment_type, id_acc_type,
 account_email, account_password, account_creation) VALUES
(1, 1, 9999, 1, 111, 'monkiespancake@yahoo.com', 'pancakemonkies', NOW()),
(2, 2, 8888, 2, 222, 'partyboba@yahoo.com','bobaparty', NOW()),
(3, 3, 7777, 3, 333, 'drinkpeaches@yahoo.com', 'peachdrink', NOW()),

(4, 4, 6666, 4, 444, 'matchatea@yahoo.com', 'teamatcha', NOW()),
(5, 5, 5555, 5, 555, 'catbunny@yahoo.com', 'bunnycat', NOW()),
(6, 6, 4444, 6, 666, 'alienship@yahoo.com', 'shipalien', NOW()),

(7, 7, 3333, 7, 777, 'pinkdrink@yahoo.com', 'drinkpink', NOW()),
(8, 8, 2222, 8, 888, 'catandmouse@yahoo.com', 'mouseandcat', NOW()),
(9, 9, 1111, 9, 999, 'roejogan@yahoo.com', 'joganroe', NOW()),

(10, 10, 1109, 10, 1000, 'macandcheese@yahoo.com', 'cheeseandmac', NOW()),
(11, 11, 1108, 11, 1100, 'magicpotion@yahoo.com', 'potionmagin', NOW()),
(12, 12, 1107, 12, 1200, 'tunacan@yahoo.com', 'cantuna', NOW());

-- Device table inserts
INSERT INTO Device (device_id, device_account_id, device_type, device_ip) VALUES
(1, 1, 'iPhone 12', '168.212.226.204'),
(2, 2, 'Windows', '506.457.143.512'),
(3, 3, 'MacBook Air', '234.748.235'),

(4, 4, 'iPhone 11', '164.268.247.875'),
(5, 5, 'Windows', '457.457.224.256'),
(6, 6, 'Mac', '246.865.678.235'),

(7, 7, 'Windows', '496.457.867.567'),
(8, 8, 'Windows', '789.654.578.543'),
(9, 9, 'Windows', '346.786.346.998'),

(10, 10, 'Windows', '468.675.467.235.'),
(11, 11, 'Windows', '875.664.894.146'),
(12, 12, 'Windows', '347.224.865.346');
-- Session table inserts
INSERT INTO Sessions (session_id, session_user_id, session_device_id, session_expire) VALUES
(1, 1, 1, NOW()),
(2, 2, 2, NOW()),
(3, 3, 3, NOW()),

(4, 4, 4, NOW()),
(5, 5, 5, NOW()),
(6, 6, 6, NOW()),

(7, 7, 7, NOW()),
(8, 8, 8, NOW()),
(9, 9, 9, NOW()),

(10, 10, 10, NOW()),
(11, 11, 11, NOW()),
(12, 12, 12, NOW());

-- Patient_Account table inserts
INSERT INTO Patient_Account (patient_account_id, acc_patient_id, patient_id, patient_description, appointment_history) VALUES
(1, 1, 1, 'A patient is a client of HHMF.', NOW()),
(2, 2, 2, 'A patient is a client of HHMF.', NOW()),
(3, 3, 3, 'A patient is a client of HHMF.', NOW());
-- Employee_Account table inserts
INSERT INTO Employee_Account (employee_account_id, acc_employee_id, employ_id, employee_account_type, 
employee_account_description) VALUES
(4, 4, 4, 'HEALTHCARE PROVIDER', 'A HEALTHCARE PROVIDER IS A PROFESSIONAL WHO IS LICENSED TO PROVIDE DIAGNOSIS AND TREATMENT.'),
(5, 5, 5, 'HEALTHCARE PROVIDER', 'A HEALTHCARE PROVIDER IS A PROFESSIONAL WHO IS LICENSED TO PROVIDE DIAGNOSIS AND TREATMENT.'),
(6, 6, 6, 'HEALTHCARE PROVIDER', 'A HEALTHCARE PROVIDER IS A PROFESSIONAL WHO IS LICENSED TO PROVIDE DIAGNOSIS AND TREATMENT.'),

(7, 7, 7, 'NURSE', 'A NURSE IS A LICENSED PROFESSIONAL TO ASSIST IN TREATMENT AND DIAGNOSIS.'),
(8, 8, 8, 'NURSE', 'A NURSE IS A LICENSED PROFESSIONAL TO ASSIST IN TREATMENT AND DIAGNOSIS.'),
(9, 9, 9, 'NURSE', 'A NURSE IS A LICENSED PROFESSIONAL TO ASSIST IN TREATMENT AND DIAGNOSIS.'),

(10, 10, 10, 'RECEPTIONIST', 'A RECEPTIONIST IS AN EMPLOYEE IN CHARGE OF ORGANIZATION AND APPOINTMENT RECORDS.'),
(11, 11, 11, 'RECEPTIONIST', 'A RECEPTIONIST IS AN EMPLOYEE IN CHARGE OF ORGANIZATION AND APPOINTMENT RECORDS.'),
(12, 12, 212, 'RECEPTIONIST', 'A RECEPTIONIST IS AN EMPLOYEE IN CHARGE OF ORGANIZATION AND APPOINTMENT RECORDS.');
-- Account_Type_Permissions table inserts
INSERT INTO Account_Type_Permissions (account_type_id, acc_type_employ_id, acc_type_patient_id) VALUES
(1, null, 1),
(2, null, 2),
(3, null, 3),

(4, 4, null),
(5, 5, null),
(6, 6, null),

(7, 7, null),
(8, 8, null),
(9, 9, null),

(10, 10, null),
(11, 11, null),
(12, 12, null);


-- Actions table inserts
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`onlineappointmentdb`.`actions`, CONSTRAINT `ACTION_PROFILE_FK` FOREIGN KEY (`action_id`) REFERENCES `account_profile` (`profile_id`) ON UPDATE CASCADE)

INSERT into Actions (action_id, action_profile, action_type, action_description) VALUES
(1, 9999, 'MAKE APPOINTMENT', 'This action allows the account to make an appointment.'),
(2, 8888, 'CHANGE PAYMENT TYPE', 'This action allows the account to change their payment type.'),
(3, 7777, 'CHANGE PROFILE', 'This action allows the account to change their profile.'),

(4, 6666, 'CHANGE PROFILE', 'This action allows the account to change their profile.'),
(5, 5555, 'CHANGE PROFILE', 'This action allows the account to change their profile.'),
(6, 4444, 'CHANGE PROFILE', 'This action allows the account to change their profile.'),

(7, 3333, 'CHANGE PAYMENT TYPE', 'This action allows the account to change their payment type.'),
(8, 2222, 'CHANGE PAYMENT TYPE', 'This action allows the account to change their payment type.'),
(9, 1111, 'CHANGE PAYMENT TYPE', 'This action allows the account to change their payment type.');
-- Permissions table inserts
INSERT INTO Permissions (permission_id, permission_acc_id, permission_action_id, permission_flag) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),

(4, 4, 2, 1),
(5, 5, 2, 1),
(6, 6, 2, 1),

(7, 7, 3, 1),
(8, 8, 3, 1),
(9, 9, 3, 1),

(10, 10, 3, 1),
(11, 11, 3, 1),
(12, 12, 3, 1);

-- Billing table inserts
INSERT INTO Billing (billing_id, billing_payment_type, billing_description, billing_date, billing_time) VALUES
(1, 1, '-BLOOD TEST.......199.99', '2021-02-25' , '08:00:00'),
(2, 2, '-ENT THROAT TEST.......300.50', '2021-03-14', '09:00:00'),
(3, 3, '-XRAY TEST.......350.00', '2021-04-15', '10:00:00');
-- Bank_Account table inserts
INSERT INTO Bank_Account (bank_account_id, bank_type, bank_payment_type_id, bank_code) VALUES
(1, 'CHECKING', 1, 9999),
(2, 'SAVING', 1, 8888),
(3, 'CHECKING', 2, 7777),
(4, 'SAVING', 2, 6666),
(5, 'CHECKING', 3, 5555),
(6, 'SAVING', 3, 4444);

-- Checking table inserts
INSERT INTO Checking (checking_routing_number, checking_bank_id, checking_account_number, checking_type) VALUES
(194748254, 1, 183637143, 'BASIC'),
(246963695, 3, 235852584, 'STUDENT'),
(388264616, 5, 377153505, 'BASIC');

-- Saving table inserts
INSERT INTO Saving (saving_routing_number, saving_bank_id, saving_account_number, saving_type) VALUES
(113983903, 2, 144685438, 'BASIC'),
(225987735, 4, 214669757, 'STUDENT'),
(337370127, 6, 369906356, 'BASIC');

-- Insurance_Company table inserts
INSERT INTO Insurance_Company (insurance_company_id, insurance_company_name, insurance_policy, insurance_premium, insurance_deductible) VALUES
(1, 'BLUE CROSS', 'THIS IS A BLUE CROSS POLICY.', 200.00, 400.00),
(2, 'MEDICAL', 'THIS IS A MEDICAL POLICY', 250.00, 450.00),
(3, 'MEDICARE', 'THIS IS A MEDICARE POLICY.', 300.00, 500.00);

-- Insurance_Plan table inserts
INSERT INTO Insurance_Plan (insurance_id, insurance_payment_type_id, insurance_co_id, insurance_issue_date, insurance_expire_date) VALUES
(128359690, 1, 1, '2015-03-24', '2022-03-24'),
(266903138, 2, 2, '2017-06-13', '2024-06-13'),
(315580236, 3, 3, '2016-07-16', '2023-07-16');

-- Department table inserts
INSERT INTO Department (department_id, department_email, department_name, department_fax_number, department_phone_number) VALUES
(11111, 'internalmedicine@hhmf.mail.com', 'Internal Medicine', '423-567-2573', '615-346-2834'),
(22222, 'ent@hhmf.mail.com', 'Ears, Nose, Throat', '423-452-1395', '615-347-2963'),
(33333,'cardiology@hhmf.mail.com', 'Cardiology', '423-196-3826','615-286-1936');
-- Employee_Address table inserts
INSERT INTO Employee_Address (employee_add_id, employee_address, employee_city, employee_state, employee_zipcode,
 employee_country) VALUES
(4, '9683 Lane', 'San Francisco', 'California', '92354', 'USA'),
(5, '3672 Court', 'Sunnyvale', 'California', '18636', 'USA'),
(6, '8963 Way', 'San Jose', 'California', '95136', ''),

(7, '6462 White Court', 'San Jose', 'California', '92354', 'USA'),
(8, '3578 Green Lane', 'San Jose', 'California', '95123', 'USA'),
(9, '4857 Money Drive', 'San Jose', 'California', '95136', 'USA'),

(10, '2578 Madame Lane', 'San Jose', 'California', '49375', 'USA'),
(11, '6666 Magic Way', 'San Jose', 'California', '84729', 'USA'),
(12, '8832 Tuna Lane', 'San Jose', 'California', '96422', 'USA');
-- Employee table inserts
INSERT INTO Employee (employee_id, employee_user_id, employee_salary, employee_address_id, employee_start_date, employee_name,
employee_phone_number) VALUES
(4, 4, 200000.00, 4, '2010-02-12', 'JOHN SMITH', '126-286-2868'),
(5, 5, 300000.00, 5, '2011-03-13', 'JAMES WILLIAMS', '596-285-8953'),
(6, 6, 250000.00, 6, '2012-04-14', 'MICHAEL SCOTT', '196-856-3632'),

(7, 7, 100000.00, 7, '2013-05-15', 'BOB EDWARDS', '274-468-2467'),
(8, 8, 100000.00, 8, '2014-06-16', 'AMY TRAN', '408-468-8645'),
(9, 9, 100000.00, 9, '2015-07-17', 'JOE ROGAN', '560-346-5578'),

(10, 10, 70000.00, 10, '2016-08-18', 'CATHY LOPEZ', '496-285-6854'),
(11, 11, 65000.00, 11, '2017-09-19', 'HARRY POTTER', '666-666-6666'),
(12, 12, 80000.00, 12, '2018-10-20', 'JIM HALPERT', '283-586-4836');

-- Employee_Department table inserts
INSERT INTO Employee_Department (employeeID, departmentID) VALUES
(4, 11111),
(5, 22222),
(6, 33333),

(7, 11111),
(8, 22222),
(9, 33333),

(10, 11111),
(11, 22222),
(12, 33333);

-- Healthcare_Provider table inserts
INSERT INTO Healthcare_Provider (hcp_id, hcp_employ_id, hcp_specialization_pos, hcp_description) Values
(1, 4, 'INTERNAL MEDICINE', 'INTERNAL MEDICINE DESCIPTION'),
(2, 5, 'EARS, NOSE, & THROAT', 'EARS, NOSE, & THROAT DESCRIPTION'),
(3, 6, 'CARDIOLOGY', 'CARDIOLOGY DESCRIPTION');
-- Nurse table inserts
INSERT INTO Nurse (nurse_id, nurse_employ_id, nurse_type, nurse_description) VALUES
(1, 7, 'REGISTERED NURSE', 'Assess patients, administer medications and treatments, & assist in diagnostic testing.'),
(2, 8, 'SURGICAL ASSISTANT REGISTERED NURSE', 'Assist surgeons during procedures and care for patients before, during and after surgery.'),
(3, 9, 'REGISTERED NURSE', 'Assess patients, administer medications and treatments, & assist in diagnostic testing.');
-- Receptionist table inserts
INSERT INTO Receptionist (reception_id, recep_employ_id, reception_description) VALUES
(1, 10, 'RECEPTION DESCRIPTION'),
(2, 11, 'RECEPTION DESCRIPTION'),
(3, 12, 'RECEPTION DESCRIPTION');
-- Location table inserts
INSERT INTO Location (location_id, location_address, location_city, location_state, location_zipcode, location_country) VALUES
(1, '4868 Lane', 'San Jose', 'California', '95122', 'USA'),
(2, '5824 Drive', 'San Jose', 'California', '95126', 'USA'),
(3, '2356 Boulevard', 'Sunnyvale', 'California', '95127', 'USA');
-- Clinic table inserts
INSERT INTO Clinic (clinic_id, clinic_location_id, clinic_name, clinic_fax_number, clinic_phone_number, clinic_email) VALUES
(1, 1, 'Happy Health Medical Foundation San Jose', '235-257-8964', '467-464-2478', 'sanjosehhmf@hhmf.mail.com'),
(2, 2, 'Happy Health Medical Foundation Sunnyvale', '235-579-2689', '467-157-3685', 'sunnyvalehhmf@hhmf.mail.com'),
(3, 3, 'Happy Health Medical Foundation San Mateo', '235-578-2578', '467-235-2368', 'sanmateohhmf@hhmf.mail.com');
-- Clinic_Workers table inserts
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`onlineappointmentdb`.`clinic_workers`, CONSTRAINT `CLINIC_WORKER_HCP_FK` FOREIGN KEY (`clinic_hcp_id`) REFERENCES `healthcare_provider` (`hcp_id`) ON DELETE CASCADE ON UPDATE CASCADE)

INSERT INTO Clinic_Workers (clinic_place_id, clinic_hcp_id, clinic_nurse_id, clinic_reception_id) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- Testing_Service table inserts
INSERT INTO Testing_Service (testing_service_id, testing_service_hcp, testing_service_patient, testing_service_time,
 testing_service_date, testing_service_description) VALUES
(1, 1, 1, '08:00:00', '2021-02-25', 'BLOOD TEST.'),
(2, 2, 2, '09:00:00', '2021-03-14', 'ENT THROAT TEST'),
(3, 3, 3, '10:00:00', '2021-04-15', 'XRAY SCAN');
-- Procedure_Operation table inserts
INSERT INTO Procedure_Operation (procedure_id, procedure_time, procedure_date, procedure_description, procedure_after_care) VALUES
(1, '10:00:00', '2021-04-19', 'Procedure is for removal of stage 0 node on face of patient.', 'Leave bandage on for 2 weeks until healed.
Return for removal of stitches.'),
(2, '11:00:00', '2021-05-20', 'Procedure is for removal of enlarged mole on neck of patient.', 'Leave bandage on for 1 week unteil healed.
Return for removal of stitches.'),
(3, '12:00:00', '2021-06-21', 'Procedure is to break up abnormal blood clots that restrict blood flow in veins and arteries.',
 'The catheter will remain in place for several days so the effectiveness of the treatment can be evaluated and repeat it if needed.');
-- Treatment_Plan table inserts
INSERT INTO Treatment_Plan (treatment_id, treatment_hcp, treatment_procedure, treatment_patient, treatment_description, 
treatment_sign_off) VALUES
(1, 1, 1, 1, 'Patient is to undergo removal of node. General anesthesia must be administered. ETC.', 1),
(2, 2, 2, 2, 'Patient is to undergo removal of node on neck. General anesthesia must be administed. ETC.', 1),
(3, 3, 3, 3, 'Patient is to undergo a thrombolysis procedure. And must return for a general check up.', 1);
-- Medicine table inserts
INSERT INTO Medicine (medicine_id, medicine_name, expire_date) VALUES
(1, 'AMOXICILLIN', '2022-02-14'),
(2, 'AZITHROMYCIN', '2022-03-24'),
(3, 'CEPHALEXIN', '2022-04-04');
-- Prescription table inserts
INSERT INTO Prescription (prescription_id, prescription_hcp, prescription_patient, prescription_medicine, prescription_sign_off,
prescription_name, prescription_description) VALUES
(1, 1, 1, 1, 1, 'AMOXICILLIN', 'ANTIBIOTIC'),
(2, 2, 2, 2, 1, 'AZITHROMYCIN', 'ANTIBIOTIC'),
(3, 3, 3, 3, 1, 'CEPHALEXIN', 'ANTIBIOTIC');
-- Pharmaceutical_Company table inserts
INSERT INTO Pharmaceutical_Company (pharmaceutical_id, pharmaceutical_name, pharmaceutical_phone_number,
pharmaceutical_net_worth) VALUES
(1, 'First For Aid', '408-236-3684', 1000000.00),
(2, 'MedEX', '408-298-4968', 2000000.00),
(3, 'Plus Aid', '408-684-9482',1500000.00);
-- Pharmacy table inserts
INSERT INTO Pharmacy (pharmacy_id, pharmacy_name, pharmacy_address, pharmacy_phone_number, pharmacy_email) VALUES
(1, 'HHMF San Jose Pharmacy', '2938 Smith Lane, San Jose, CA 95321', '408-596-2843', 'sjpharm@hhmf.mail.com'),
(2, 'HHMF San Francisco Pharmacy', '3958 James Street, San Francisco, CA 92314', '415-394-4968', 'sfpharm@hhmf.mail.com'),
(3, 'HHMF Sunnyvale Pharmacy', '1285 Lincoln Avenue, Sunnyvale, CA 95138', '408-275-3789', 'sunnyvalepharm@hhmf.mail.com');
-- Manufacturing table inserts
INSERT INTO Manufacturing (manufacture_id, pharmCo_id, med_id, manufacture_location, manufacture_date) VALUES
(1, 1, 1, '2342 Place, San Jose, CA 94231', '2021-02-14'),
(2, 2, 2, '9674 Court, San Francisco, CA  94238', '2021-03-24'),
(3, 3, 3, '58692 Way, Oakland, CA 92547', '2021-04-04');
-- Contract table inserts
INSERT INTO Contract (contract_id, pharmacyId, pharmCom_id, contract_start_date, contract_end_date, contract_description) VALUES
(1, 1, 1, '2017-03-02', '2024-03-02', 'This is a contract between First For Aid and HHMF San Jose Pharmacy.'),
(2, 2, 2, '2018-07-14', '2025-07-14', 'This is a contract between MedEX and HHMF San Francisco Pharmacy.'),
(3, 3, 3, '2019-09-05', '2026-09-05', 'This is a contract between Plus Aid and HHMF Sunnyvale Pharmacy.');
-- Pharmacy_Sales table inserts
INSERT INTO Pharmacy_Sales (sales_id, sale_medicine_id, sale_pharmacy_id, sale_product_quantity, sale_medicine_price) VALUES
(1, 1, 1, 5, 200.00),
(2, 2, 2, 10, 250.00),
(3, 3, 3, 20, 300.00);
-- Date table inserts
INSERT INTO Calendar_Date (calendar_date ,calendar_date_available, calendar_date_booked) VALUES
('2021-10-10', 1, 0),
('2021-10-15', 1, 0),
('2021-10-20', 1, 0);
-- Time table inserts
INSERT INTO Calendar_Time (time_schedule ,time_available, time_booked) VALUES
('12:30:00', 1, 0),
('11:30:00' ,1, 0),
('10:00:00', 1, 0);
-- Appointment table inserts
INSERT INTO Appointment (appt_id, appt_patient_acc, appt_hcp_id, appt_date, appt_time, appt_confirmation, after_care_notes) VALUES
(1, 1, 1, '2021-10-10', '12:30:00', 1, 'THIS IS AFTERCARE NOTES.'),
(2, 2, 2, '2021-10-15', '11:30:00', 1, 'THIS IS AFTERCARE NOTES.'),
(3, 3, 3, '2021-10-20', '10:00:00', 1, 'THIS IS AFTERCARE NOTES.');


