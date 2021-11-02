-- MySQL Script generated by MySQL Workbench
-- Tue Nov  2 00:38:48 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP DATABASE IF EXISTS OnlineAppointmentDB;
CREATE DATABASE IF NOT EXISTS OnlineAppointmentDB;
USE OnlineAppointmentDB;
-- -----------------------------------------------------
-- Table `General_User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `General_User` ;

CREATE TABLE IF NOT EXISTS `General_User` (
  `user_id` INT(9) NOT NULL,
  `user_name` VARCHAR(50) NOT NULL,
  `user_last_name` VARCHAR(50) NOT NULL,
  `user_email` VARCHAR(50) NOT NULL,
  `user_phone_number` VARCHAR(12) NOT NULL,
  `user_dob` VARCHAR(45) NOT NULL,
  `user_address` VARCHAR(45) NOT NULL,
  `is_reg_user` TINYINT(1) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patient_Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patient_Address` ;

CREATE TABLE IF NOT EXISTS `Patient_Address` (
  `patient_add_id` INT(9) NOT NULL,
  `patient_address` VARCHAR(45) NOT NULL,
  `patient_city` VARCHAR(45) NOT NULL,
  `patient_state` VARCHAR(45) NOT NULL,
  `patient_zipcode` VARCHAR(45) NOT NULL,
  `patient_country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`patient_add_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patient` ;

CREATE TABLE IF NOT EXISTS `Patient` (
  `patient_id` INT(9) NOT NULL,
  `patient_user_id` INT(9) NOT NULL,
  `p_address_id` INT(9) NOT NULL,
  `patient_name` VARCHAR(45) NOT NULL,
  `patient_email` VARCHAR(45) NOT NULL,
  `patient_phone_number` VARCHAR(12) NOT NULL,
  `patient_dob` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`patient_id`, `patient_user_id`),
  INDEX `PATIENT_USER_FK_idx` (`patient_user_id` ASC) VISIBLE,
  INDEX `PATIENT_ADD_FK_idx` (`p_address_id` ASC) VISIBLE,
  CONSTRAINT `PATIENT_USER_FK`
    FOREIGN KEY (`patient_user_id`)
    REFERENCES `General_User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `PATIENT_ADD_FK`
    FOREIGN KEY (`p_address_id`)
    REFERENCES `Patient_Address` (`patient_add_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Account_Profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Account_Profile` ;

CREATE TABLE IF NOT EXISTS `Account_Profile` (
  `profile_id` INT(9) NOT NULL,
  `profile_pronouns` VARCHAR(45) NULL,
  `profile_picture` VARCHAR(45) NULL,
  PRIMARY KEY (`profile_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payment_Type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Payment_Type` ;

CREATE TABLE IF NOT EXISTS `Payment_Type` (
  `payment_type_id` INT(9) NOT NULL,
  `billing_address` VARCHAR(45) NOT NULL,
  `billing_city` VARCHAR(45) NOT NULL,
  `billing_state` VARCHAR(45) NOT NULL,
  `billing_zipcode` VARCHAR(45) NOT NULL,
  `billing_country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`payment_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Accounts` ;

CREATE TABLE IF NOT EXISTS `Accounts` (
  `account_id` INT(9) NOT NULL,
  `account_user_id` INT(9) NOT NULL,
  `account_profile` INT(9) NOT NULL,
  `account_payment_type` INT(9) NOT NULL,
  `id_acc_type` INT(9) NOT NULL,
  `account_email` VARCHAR(45) NOT NULL,
  `account_password` VARCHAR(45) NOT NULL,
  `account_creation` DATETIME NOT NULL,
  PRIMARY KEY (`account_id`, `account_user_id`, `account_profile`, `account_payment_type`, `id_acc_type`),
  INDEX `ACC_PAYMENT_FK_idx` (`account_payment_type` ASC) VISIBLE,
  INDEX `ACC_PROFILE_FK_idx` (`account_profile` ASC) VISIBLE,
  INDEX `ACC_USER_FK_idx` (`account_user_id` ASC) VISIBLE,
  CONSTRAINT `ACC_PROFILE_FK`
    FOREIGN KEY (`account_profile`)
    REFERENCES `Account_Profile` (`profile_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ACC_PAYMENT_FK`
    FOREIGN KEY (`account_payment_type`)
    REFERENCES `Payment_Type` (`payment_type_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `ACC_USER_FK`
    FOREIGN KEY (`account_user_id`)
    REFERENCES `General_User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Device`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Device` ;

CREATE TABLE IF NOT EXISTS `Device` (
  `device_id` INT(9) NOT NULL,
  `device_account_id` INT(9) NULL,
  `device_type` VARCHAR(45) NULL,
  `device_ip` VARCHAR(45) NULL,
  PRIMARY KEY (`device_id`),
  INDEX `DEVICE_ACC_FK_idx` (`device_account_id` ASC) VISIBLE,
  CONSTRAINT `DEVICE_ACC_FK`
    FOREIGN KEY (`device_account_id`)
    REFERENCES `Accounts` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sessions` ;

CREATE TABLE IF NOT EXISTS `Sessions` (
  `session_id` INT(9) NOT NULL,
  `session_user_id` INT(9) NOT NULL,
  `session_device_id` INT(9) NOT NULL,
  `session_expire` DATETIME NULL,
  INDEX `SESSION_REG_USER_idx` (`session_user_id` ASC) VISIBLE,
  PRIMARY KEY (`session_device_id`, `session_user_id`, `session_id`),
  CONSTRAINT `SESSION_DEVICE_FK`
    FOREIGN KEY (`session_device_id`)
    REFERENCES `Device` (`device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `SESSION_USER_FK`
    FOREIGN KEY (`session_user_id`)
    REFERENCES `General_User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee_Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee_Account` ;

CREATE TABLE IF NOT EXISTS `Employee_Account` (
  `employee_account_id` INT(9) NOT NULL,
  `acc_employee_id` INT(9) NOT NULL,
  `employ_id` INT(9) NOT NULL,
  `employee_account_type` VARCHAR(45) NULL,
  `employee_account_description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`employee_account_id`, `acc_employee_id`, `employ_id`),
  INDEX `EMPLOYEE_ACC_FK_idx` (`acc_employee_id` ASC) VISIBLE,
  CONSTRAINT `EMPLOYEE_ACC_FK`
    FOREIGN KEY (`acc_employee_id`)
    REFERENCES `Accounts` (`account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Patient_Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Patient_Account` ;

CREATE TABLE IF NOT EXISTS `Patient_Account` (
  `patient_account_id` INT(9) NOT NULL,
  `acc_patient_id` INT(9) NOT NULL,
  `patient_id` INT(9) NOT NULL,
  `patient_description` VARCHAR(45) NOT NULL,
  `appointment_history` DATETIME NULL,
  PRIMARY KEY (`patient_account_id`, `acc_patient_id`, `patient_id`),
  INDEX `PATIENT_ACC_FK_idx` (`acc_patient_id` ASC) VISIBLE,
  CONSTRAINT `PATIENT_ACC_FK`
    FOREIGN KEY (`acc_patient_id`)
    REFERENCES `Accounts` (`account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bank_Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bank_Account` ;

CREATE TABLE IF NOT EXISTS `Bank_Account` (
  `bank_account_id` INT(12) NOT NULL,
  `bank_type` VARCHAR(45) NOT NULL,
  `bank_payment_type_id` INT(9) NOT NULL,
  `bank_code` INT(4) NOT NULL,
  PRIMARY KEY (`bank_account_id`, `bank_type`, `bank_payment_type_id`),
  INDEX `BANK_PAY_TYPE_FK_idx` (`bank_payment_type_id` ASC) VISIBLE,
  CONSTRAINT `BANK_PAY_TYPE_FK`
    FOREIGN KEY (`bank_payment_type_id`)
    REFERENCES `Payment_Type` (`payment_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Checking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Checking` ;

CREATE TABLE IF NOT EXISTS `Checking` (
  `checking_routing_number` INT(9) NOT NULL,
  `checking_bank_id` INT(9) NOT NULL,
  `checking_account_number` INT(12) NOT NULL,
  `checking_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`checking_routing_number`, `checking_bank_id`, `checking_account_number`),
  INDEX `CHECK_BANK_FK_idx` (`checking_bank_id` ASC) VISIBLE,
  CONSTRAINT `CHECK_BANK_FK`
    FOREIGN KEY (`checking_bank_id`)
    REFERENCES `Bank_Account` (`bank_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saving`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Saving` ;

CREATE TABLE IF NOT EXISTS `Saving` (
  `saving_routing_number` INT(9) NOT NULL,
  `saving_bank_id` INT(9) NOT NULL,
  `saving_account_number` INT(9) NOT NULL,
  `saving_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`saving_routing_number`, `saving_bank_id`, `saving_account_number`),
  INDEX `SAVING_BANK_FK_idx` (`saving_bank_id` ASC) VISIBLE,
  CONSTRAINT `SAVING_BANK_FK`
    FOREIGN KEY (`saving_bank_id`)
    REFERENCES `Bank_Account` (`bank_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Billing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Billing` ;

CREATE TABLE IF NOT EXISTS `Billing` (
  `billing_id` INT(9) NOT NULL,
  `billing_payment_type` INT(9) NOT NULL,
  `billing_description` VARCHAR(45) NULL,
  `billing_date` DATE NULL,
  `billing_time` TIME NULL,
  PRIMARY KEY (`billing_id`, `billing_payment_type`),
  INDEX `BILLING_PAYMENT_TYPE_FK_idx` (`billing_payment_type` ASC) VISIBLE,
  CONSTRAINT `BILLING_PAYMENT_TYPE_FK`
    FOREIGN KEY (`billing_payment_type`)
    REFERENCES `Payment_Type` (`payment_type_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Insurance_Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Insurance_Company` ;

CREATE TABLE IF NOT EXISTS `Insurance_Company` (
  `insurance_company_id` INT(9) NOT NULL,
  `insurance_company_name` VARCHAR(45) NOT NULL,
  `insurance_policy` VARCHAR(255) NOT NULL,
  `insurance_premium` DOUBLE NOT NULL,
  `insurance_deductible` DOUBLE NOT NULL,
  PRIMARY KEY (`insurance_company_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Insurance_Plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Insurance_Plan` ;

CREATE TABLE IF NOT EXISTS `Insurance_Plan` (
  `insurance_id` INT(9) NOT NULL,
  `insurance_payment_type_id` INT(9) NOT NULL,
  `insurance_co_id` INT(9) NOT NULL,
  `insurance_issue_date` DATETIME NOT NULL,
  `insurance_expire_date` DATETIME NOT NULL,
  PRIMARY KEY (`insurance_id`, `insurance_payment_type_id`),
  INDEX `INSURANCE_PAYMENT_FK_idx` (`insurance_payment_type_id` ASC) VISIBLE,
  INDEX `INSURANCE_COMPANY_FK_idx` (`insurance_co_id` ASC) VISIBLE,
  CONSTRAINT `INSURANCE_PAYMENT_FK`
    FOREIGN KEY (`insurance_payment_type_id`)
    REFERENCES `Payment_Type` (`payment_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `INSURANCE_COMPANY_FK`
    FOREIGN KEY (`insurance_co_id`)
    REFERENCES `Insurance_Company` (`insurance_company_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Actions` ;

CREATE TABLE IF NOT EXISTS `Actions` (
  `action_id` INT(9) NOT NULL,
  `action_profile` INT(9) NULL,
  `action_type` VARCHAR(45) NULL,
  `action_description` VARCHAR(255) NULL,
  PRIMARY KEY (`action_id`),
  INDEX `ACTION_PROFILE_FK_idx` (`action_profile` ASC) VISIBLE,
  CONSTRAINT `ACTION_PROFILE_FK`
    FOREIGN KEY (`action_profile`)
    REFERENCES `Account_Profile` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Account_Type_Permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Account_Type_Permissions` ;

CREATE TABLE IF NOT EXISTS `Account_Type_Permissions` (
  `account_type_id` INT(9) NOT NULL,
  `acc_type_employ_id` INT(9) NULL,
  `acc_type_patient_id` INT(9) NULL,
  PRIMARY KEY (`account_type_id`),
  INDEX `ACC_TYPE_PATIENT_FK_idx` (`acc_type_patient_id` ASC) VISIBLE,
  INDEX `ACC_TYPE_EMPLOY_FK_idx` (`acc_type_employ_id` ASC) VISIBLE,
  CONSTRAINT `ACC_TYPE_PATIENT_FK`
    FOREIGN KEY (`acc_type_patient_id`)
    REFERENCES `Patient_Account` (`patient_account_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `ACC_TYPE_EMPLOY_FK`
    FOREIGN KEY (`acc_type_employ_id`)
    REFERENCES `Employee_Account` (`employee_account_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Permissions` ;

CREATE TABLE IF NOT EXISTS `Permissions` (
  `permission_id` INT(9) NOT NULL,
  `permission_acc_id` INT(9) NOT NULL,
  `permission_action_id` INT(9) NOT NULL,
  `permission_flag` TINYINT(1) NULL,
  PRIMARY KEY (`permission_id`, `permission_acc_id`, `permission_action_id`),
  INDEX `PERMISSION_ACTION_FK_idx` (`permission_action_id` ASC) VISIBLE,
  INDEX `PERMISSION_ACC_TYPE_FK_idx` (`permission_acc_id` ASC) VISIBLE,
  CONSTRAINT `PERMISSION_ACTION_FK`
    FOREIGN KEY (`permission_action_id`)
    REFERENCES `Actions` (`action_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `PERMISSION_ACC_TYPE_FK`
    FOREIGN KEY (`permission_acc_id`)
    REFERENCES `Account_Type_Permissions` (`account_type_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Calendar_Date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Calendar_Date` ;

CREATE TABLE IF NOT EXISTS `Calendar_Date` (
  `calendar_date` DATETIME NOT NULL,
  `calendar_date_available` TINYINT(1) NOT NULL,
  `calendar_date_booked` TINYINT(1) NULL,
  PRIMARY KEY (`calendar_date`, `calendar_date_available`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Calendar_Time`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Calendar_Time` ;

CREATE TABLE IF NOT EXISTS `Calendar_Time` (
  `time_schedule` TIME NOT NULL,
  `time_available` TINYINT(1) NOT NULL,
  `time_booked` TINYINT(1) NULL,
  PRIMARY KEY (`time_schedule`, `time_available`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee_Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee_Address` ;

CREATE TABLE IF NOT EXISTS `Employee_Address` (
  `employee_add_id` INT(9) NOT NULL,
  `employee_address` VARCHAR(45) NULL,
  `employee_city` VARCHAR(45) NULL,
  `employee_state` VARCHAR(45) NULL,
  `employee_zipcode` VARCHAR(45) NULL,
  `employee_country` VARCHAR(45) NULL,
  PRIMARY KEY (`employee_add_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee` ;

CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_id` INT(9) NOT NULL,
  `employee_user_id` INT(9) NOT NULL,
  `employee_address_id` INT(9) NOT NULL,
  `employee_email` VARCHAR(50) NULL,
  `employee_salary` DECIMAL(10) NULL,
  `employee_start_date` DATE NULL,
  `employee_name` VARCHAR(45) NULL,
  `employee_phone_number` VARCHAR(12) NULL,
  PRIMARY KEY (`employee_id`, `employee_user_id`),
  INDEX `EMPLOYEE_USER_FK_idx` (`employee_user_id` ASC) VISIBLE,
  INDEX `EMPLOYEE_ADDRESS_FK_idx` (`employee_address_id` ASC) VISIBLE,
  CONSTRAINT `EMPLOYEE_USER_FK`
    FOREIGN KEY (`employee_user_id`)
    REFERENCES `General_User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `EMPLOYEE_ADDRESS_FK`
    FOREIGN KEY (`employee_address_id`)
    REFERENCES `Employee_Address` (`employee_add_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Healthcare_Provider`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Healthcare_Provider` ;

CREATE TABLE IF NOT EXISTS `Healthcare_Provider` (
  `hcp_id` INT(9) NOT NULL,
  `hcp_employ_id` INT(9) NOT NULL,
  `hcp_specialization_pos` VARCHAR(45) NULL,
  `hcp_description` VARCHAR(45) NULL,
  PRIMARY KEY (`hcp_id`, `hcp_employ_id`),
  INDEX `HCP_EMPLOY_FK_idx` (`hcp_employ_id` ASC) VISIBLE,
  CONSTRAINT `HCP_EMPLOY_FK`
    FOREIGN KEY (`hcp_employ_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Appointment` ;

CREATE TABLE IF NOT EXISTS `Appointment` (
  `appt_id` INT(9) NOT NULL,
  `appt_patient_acc` INT(9) NOT NULL,
  `appt_hcp_id` INT(9) NOT NULL,
  `appt_date` DATETIME NOT NULL,
  `appt_time` TIME NOT NULL,
  `appt_confirmation` TINYINT(1) NULL,
  `after_care_notes` VARCHAR(255) NULL,
  PRIMARY KEY (`appt_hcp_id`, `appt_patient_acc`, `appt_id`),
  INDEX `APPT_DATE_FK_idx` (`appt_date` ASC) VISIBLE,
  INDEX `APPT_TIME_FK_idx` (`appt_time` ASC) VISIBLE,
  INDEX `APPT_PATIENT_ACC_FK_idx` (`appt_patient_acc` ASC) VISIBLE,
  CONSTRAINT `APPT_PATIENT_ACC_FK`
    FOREIGN KEY (`appt_patient_acc`)
    REFERENCES `Patient_Account` (`patient_account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `APPT_DATE_FK`
    FOREIGN KEY (`appt_date`)
    REFERENCES `Calendar_Date` (`calendar_date`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `APPT_TIME_FK`
    FOREIGN KEY (`appt_time`)
    REFERENCES `Calendar_Time` (`time_schedule`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `APPT_HCP_FK`
    FOREIGN KEY (`appt_hcp_id`)
    REFERENCES `Healthcare_Provider` (`hcp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Nurse` ;

CREATE TABLE IF NOT EXISTS `Nurse` (
  `nurse_id` INT(9) NOT NULL,
  `nurse_employ_id` INT(9) NOT NULL,
  `nurse_type` VARCHAR(45) NULL,
  `nurse_description` VARCHAR(255) NULL,
  PRIMARY KEY (`nurse_id`, `nurse_employ_id`),
  INDEX `NURSE_EMPLOY_FK_idx` (`nurse_employ_id` ASC) VISIBLE,
  CONSTRAINT `NURSE_EMPLOY_FK`
    FOREIGN KEY (`nurse_employ_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Receptionist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Receptionist` ;

CREATE TABLE IF NOT EXISTS `Receptionist` (
  `reception_id` INT(9) NOT NULL,
  `recep_employ_id` INT(9) NOT NULL,
  `reception_description` VARCHAR(45) NULL,
  PRIMARY KEY (`reception_id`, `recep_employ_id`),
  INDEX `RECEPTION_EMPLOY_FK_idx` (`recep_employ_id` ASC) VISIBLE,
  CONSTRAINT `RECEPTION_EMPLOY_FK`
    FOREIGN KEY (`recep_employ_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Department` ;

CREATE TABLE IF NOT EXISTS `Department` (
  `department_id` INT(9) NOT NULL,
  `department_email` VARCHAR(45) NULL,
  `department_name` VARCHAR(45) NULL,
  `department_fax_number` VARCHAR(45) NULL,
  `department_phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Location` ;

CREATE TABLE IF NOT EXISTS `Location` (
  `location_id` INT(9) NOT NULL,
  `location_address` VARCHAR(50) NULL,
  `location_city` VARCHAR(45) NULL,
  `location_state` VARCHAR(45) NULL,
  `location_zipcode` VARCHAR(10) NULL,
  `location_country` VARCHAR(45) NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Clinic` ;

CREATE TABLE IF NOT EXISTS `Clinic` (
  `clinic_id` INT(9) NOT NULL,
  `clinic_location_id` INT(9) NOT NULL,
  `clinic_name` VARCHAR(45) NULL,
  `clinic_fax_number` VARCHAR(45) NULL,
  `clinic_phone_number` VARCHAR(45) NULL,
  `clinic_email` VARCHAR(45) NULL,
  PRIMARY KEY (`clinic_id`, `clinic_location_id`),
  INDEX `CLINIC_LOCATION_FK_idx` (`clinic_location_id` ASC) VISIBLE,
  CONSTRAINT `CLINIC_LOCATION_FK`
    FOREIGN KEY (`clinic_location_id`)
    REFERENCES `Location` (`location_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pharmacy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pharmacy` ;

CREATE TABLE IF NOT EXISTS `Pharmacy` (
  `pharmacy_id` INT(9) NOT NULL,
  `pharmacy_name` VARCHAR(45) NULL,
  `pharmacy_address` VARCHAR(255) NULL,
  `pharmacy_phone_number` VARCHAR(45) NULL,
  `pharmacy_email` VARCHAR(45) NULL,
  PRIMARY KEY (`pharmacy_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pharmaceutical_Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pharmaceutical_Company` ;

CREATE TABLE IF NOT EXISTS `Pharmaceutical_Company` (
  `pharmaceutical_id` INT(9) NOT NULL,
  `pharmaceutical_name` VARCHAR(45) NULL,
  `pharmaceutical_phone_number` VARCHAR(25) NULL,
  `pharmaceutical_net_worth` DECIMAL(10) NULL,
  PRIMARY KEY (`pharmaceutical_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Contract` ;

CREATE TABLE IF NOT EXISTS `Contract` (
  `contract_id` INT(9) NOT NULL,
  `pharmacyId` INT(9) NOT NULL,
  `pharmCom_id` INT(9) NOT NULL,
  `contract_start_date` DATE NULL,
  `contract_end_date` DATE NULL,
  `contract_description` VARCHAR(255) NULL,
  PRIMARY KEY (`contract_id`, `pharmacyId`, `pharmCom_id`),
  INDEX `CONTRACT_PHARMCO_FK_idx` (`pharmCom_id` ASC) VISIBLE,
  CONSTRAINT `CONTRACT_PHARMCO_FK`
    FOREIGN KEY (`pharmCom_id`)
    REFERENCES `Pharmaceutical_Company` (`pharmaceutical_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `CONTRACT_PHARMACY_FK`
    FOREIGN KEY (`pharmacyId`)
    REFERENCES `Pharmacy` (`pharmacy_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medicine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medicine` ;

CREATE TABLE IF NOT EXISTS `Medicine` (
  `medicine_id` INT(9) NOT NULL,
  `medicine_name` VARCHAR(45) NULL,
  `expire_date` DATE NULL,
  PRIMARY KEY (`medicine_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Manufacturing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Manufacturing` ;

CREATE TABLE IF NOT EXISTS `Manufacturing` (
  `manufacture_id` INT(9) NOT NULL,
  `pharmCo_id` INT(9) NOT NULL,
  `med_id` INT(9) NOT NULL,
  `manufacture_location` VARCHAR(255) NULL,
  `manufacture_date` DATE NULL,
  CONSTRAINT `MANUFACTURE_MED_FK`
    FOREIGN KEY (`med_id`)
    REFERENCES `Medicine` (`medicine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MANUFACTURE_PHARMCO_FK`
    FOREIGN KEY (`pharmCo_id`)
    REFERENCES `Pharmaceutical_Company` (`pharmaceutical_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pharmacy_Sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pharmacy_Sales` ;

CREATE TABLE IF NOT EXISTS `Pharmacy_Sales` (
  `sales_id` INT(9) NOT NULL,
  `sale_medicine_id` INT(9) NOT NULL,
  `sale_pharmacy_id` INT(9) NOT NULL,
  `sale_product_quantity` INT NULL,
  `sale_medicine_price` DECIMAL(5) NULL,
  PRIMARY KEY (`sales_id`),
  INDEX `PHARM_SALES_FK_idx` (`sale_pharmacy_id` ASC) VISIBLE,
  CONSTRAINT `PHARM_SALES_FK`
    FOREIGN KEY (`sale_pharmacy_id`)
    REFERENCES `Pharmacy` (`pharmacy_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `PHARM_SALES_MED_FK`
    FOREIGN KEY (`sale_medicine_id`)
    REFERENCES `Medicine` (`medicine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Prescription` ;

CREATE TABLE IF NOT EXISTS `Prescription` (
  `prescription_id` INT NOT NULL,
  `prescription_hcp` INT(9) NOT NULL,
  `prescription_patient` INT(9) NOT NULL,
  `prescription_medicine` INT(9) NOT NULL,
  `prescription_sign_off` TINYINT(1) NULL,
  `prescription_name` VARCHAR(45) NULL,
  `prescription_description` VARCHAR(45) NULL,
  PRIMARY KEY (`prescription_id`, `prescription_patient`, `prescription_medicine`, `prescription_hcp`),
  INDEX `PRESCRIPTION_HCP_FK_idx` (`prescription_hcp` ASC) VISIBLE,
  INDEX `PRESCRIPTION_PATIENT_FK_idx` (`prescription_patient` ASC) VISIBLE,
  INDEX `PRESCRIPTION_MED_FK_idx` (`prescription_medicine` ASC) VISIBLE,
  CONSTRAINT `PRESCRIPTION_HCP_FK`
    FOREIGN KEY (`prescription_hcp`)
    REFERENCES `Healthcare_Provider` (`hcp_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `PRESCRIPTION_PATIENT_FK`
    FOREIGN KEY (`prescription_patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `PRESCRIPTION_MED_FK`
    FOREIGN KEY (`prescription_medicine`)
    REFERENCES `Medicine` (`medicine_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Procedure_Operation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Procedure_Operation` ;

CREATE TABLE IF NOT EXISTS `Procedure_Operation` (
  `procedure_id` INT(9) NOT NULL,
  `procedure_time` TIME NULL,
  `procedure_date` DATETIME NULL,
  `procedure_description` VARCHAR(255) NULL,
  `procedure_after_care` VARCHAR(255) NULL,
  PRIMARY KEY (`procedure_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Treatment_Plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Treatment_Plan` ;

CREATE TABLE IF NOT EXISTS `Treatment_Plan` (
  `treatment_id` INT(9) NOT NULL,
  `treatment_hcp` INT(9) NOT NULL,
  `treatment_procedure` INT(9) NOT NULL,
  `treatment_patient` INT(9) NOT NULL,
  `treatment_description` VARCHAR(255) NULL,
  `treatment_sign_off` TINYINT(1) NULL,
  PRIMARY KEY (`treatment_id`, `treatment_hcp`, `treatment_patient`, `treatment_procedure`),
  INDEX `TREATMENT_HCP_FK_idx` (`treatment_hcp` ASC) VISIBLE,
  INDEX `TREATMENT_PROCEDURE_FK_idx` (`treatment_procedure` ASC) VISIBLE,
  INDEX `TREATMENT_PATIENT_idx` (`treatment_patient` ASC) VISIBLE,
  CONSTRAINT `TREATMENT_HCP_FK`
    FOREIGN KEY (`treatment_hcp`)
    REFERENCES `Healthcare_Provider` (`hcp_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `TREATMENT_PROCEDURE_FK`
    FOREIGN KEY (`treatment_procedure`)
    REFERENCES `Procedure_Operation` (`procedure_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `TREATMENT_PATIENT`
    FOREIGN KEY (`treatment_patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Testing_Service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Testing_Service` ;

CREATE TABLE IF NOT EXISTS `Testing_Service` (
  `testing_service_id` INT(9) NOT NULL,
  `testing_service_hcp` INT(9) NOT NULL,
  `testing_service_patient` INT(9) NOT NULL,
  `testing_service_name` VARCHAR(45) NULL,
  `testing_service_time` TIME NULL,
  `testing_service_date` DATE NULL,
  `testing_service_description` VARCHAR(255) NULL,
  PRIMARY KEY (`testing_service_id`, `testing_service_hcp`, `testing_service_patient`),
  INDEX `TESTING_HCP_FK_idx` (`testing_service_hcp` ASC) VISIBLE,
  INDEX `TESTING_PATIENT_FK_idx` (`testing_service_patient` ASC) VISIBLE,
  CONSTRAINT `TESTING_HCP_FK`
    FOREIGN KEY (`testing_service_hcp`)
    REFERENCES `Healthcare_Provider` (`hcp_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `TESTING_PATIENT_FK`
    FOREIGN KEY (`testing_service_patient`)
    REFERENCES `Patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clinic_Workers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Clinic_Workers` ;

CREATE TABLE IF NOT EXISTS `Clinic_Workers` (
  `clinic_place_id` INT(9) NOT NULL,
  `clinic_hcp_id` INT(9) NULL,
  `clinic_nurse_id` INT(9) NULL,
  `clinic_reception_id` INT(9) NULL,
  PRIMARY KEY (`clinic_place_id`),
  INDEX `CLINIC_WORKER_HCP_FK_idx` (`clinic_hcp_id` ASC) VISIBLE,
  INDEX `CLINIC_WORKER_NURSE_FK_idx` (`clinic_nurse_id` ASC) VISIBLE,
  INDEX `CLINIC_WORKER_RECEPTION_FK_idx` (`clinic_reception_id` ASC) VISIBLE,
  CONSTRAINT `CLINIC_WORKER_HCP_FK`
    FOREIGN KEY (`clinic_hcp_id`)
    REFERENCES `Healthcare_Provider` (`hcp_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CLINIC_WORKER_NURSE_FK`
    FOREIGN KEY (`clinic_nurse_id`)
    REFERENCES `Nurse` (`nurse_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CLINIC_WORKER_RECEPTION_FK`
    FOREIGN KEY (`clinic_reception_id`)
    REFERENCES `Receptionist` (`reception_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CLINIC_WORKER_FK`
    FOREIGN KEY (`clinic_place_id`)
    REFERENCES `Clinic` (`clinic_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee_Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee_Department` ;

CREATE TABLE IF NOT EXISTS `Employee_Department` (
  `employeeID` INT(9) NOT NULL,
  `departmentID` INT(9) NOT NULL,
  INDEX `DEP_EMPLOYEE_FK_idx` (`departmentID` ASC) VISIBLE,
  PRIMARY KEY (`employeeID`, `departmentID`),
  CONSTRAINT `EMPLOYEE_DEP_FK`
    FOREIGN KEY (`employeeID`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `DEP_EMPLOYEE_FK`
    FOREIGN KEY (`departmentID`)
    REFERENCES `Department` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
