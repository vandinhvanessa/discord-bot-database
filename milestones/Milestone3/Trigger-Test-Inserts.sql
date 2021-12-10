USE OnlineAppointmentDB;

-- For Trigger #1
INSERT INTO Medicine(medicine_id, medicine_name, expire_date) VALUES(4, 'IBUPROFEN', NULL);

-- For Trigger #2
INSERT INTO Procedure_Operation(procedure_id, procedure_time, procedure_date, procedure_description, procedure_after_care) VALUES
(4, NULL, NULL, 'Procedure not in service.', 'Procedure not in service.');




