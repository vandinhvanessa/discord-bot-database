# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors

db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']


def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")
    
# your code here
def getPatients(conn):
  cur = conn.cursor() 
  # Select query
  cur.execute("SELECT patient_name AS 'Patient' from Patient WHERE patient_id = 1")
  output = cur.fetchall()
  results = []
  for i in output:
    print("output: ", i)
    results.append(i)
  return results

def getAccountProfiles(conn, yearLowerBound, yearUpperBound, num):
  cur = conn.cursor()
  print(yearLowerBound)
  print(yearUpperBound)
  cur.execute("SELECT profile_pronouns AS 'Pronouns' , profile_id AS 'Profile ID' FROM Account_Profile acc_profile JOIN Accounts accounts ON acc_profile.profile_id = accounts.account_profile JOIN General_User users ON accounts.account_id = users.user_id JOIN Payment_Type pay_type ON accounts.account_payment_type = pay_type.payment_type_id JOIN Billing bills ON pay_type.payment_type_id = bills.billing_payment_type JOIN Insurance_Plan insur_plan ON pay_type.payment_type_id = insur_plan.insurance_payment_type_id WHERE insur_plan.insurance_issue_date BETWEEN '" + yearLowerBound + "-01-01' AND '" + yearUpperBound + "-01-01'")

  output = cur.fetchall()
  results = []
  for i in output:
    print("output: ", i)
    results.append(i)
  return results

def getPreviousAppointments(conn, yearLowerBound, yearUpperBound):

  cur = conn.cursor()
  cur.execute("SELECT appt_id AS 'ID', appt_patient_acc AS 'Patient ID', DATE(appt_date) AS 'Appt Date', TIME(appt_time) AS 'Appt Time' FROM Appointment appts JOIN Patient_Account pat_acc ON appts.appt_patient_acc = pat_acc.patient_account_id JOIN Healthcare_Provider hcps ON appts.appt_hcp_id = hcp_id JOIN Treatment_Plan treatments ON hcps.hcp_id = treatments.treatment_hcp JOIN Procedure_Operation procedure_op ON treatments.treatment_procedure = procedure_op.procedure_id WHERE procedure_op.procedure_date BETWEEN '" + yearLowerBound + "-01-01' AND '" + yearUpperBound + "-01-01'")
  output = cur.fetchall()
  results = []
  for i in output:
    print("output: ", i)
    results.append(i)
  return results

def getPharmacySales(conn):
  cur = conn.cursor()
  cur.execute("SELECT pharmacy_name AS 'Pharmacy Name', SUM(Pharmacy_Sales.sale_product_quantity * Pharmacy_Sales.sale_medicine_price) AS 'Total Sales' FROM Pharmacy_Sales, Pharmacy pharmacy JOIN Contract ON pharmacy.pharmacy_id = Contract.pharmacyId JOIN Pharmaceutical_Company pharmCo ON Contract.pharmCom_id = pharmCo.pharmaceutical_id WHERE (pharmacy.pharmacy_id = Pharmacy_Sales.sale_pharmacy_id) AND (pharmacy.pharmacy_id = Contract.pharmacyId) AND (Contract.pharmCom_id = pharmCo.pharmaceutical_id) GROUP BY pharmacy_name;")
  output = cur.fetchall()
  results = []
  for i in output:
    print("output: ", i)
    results.append(i)
  return results

def getProceduresAndPrescriptions(conn, aveAge, numPresc):
  cur = conn.cursor()
  cur.execute("SELECT procedure_id AS 'ID', procedure_time AS 'Time', DATE(procedure_date) AS 'Date', patient_name AS 'Patient' FROM Procedure_Operation procedures, Patient patients JOIN Prescription prescription ON patients.patient_id = prescription.prescription_patient JOIN Treatment_Plan treatments ON patients.patient_id = treatments.treatment_patient WHERE (procedure_id = treatments.treatment_procedure) AND (TIMESTAMPDIFF(YEAR,  CAST(patient_dob AS DATE), CURDATE()) > " + aveAge + ") GROUP BY procedure_id, patient_name, patient_dob HAVING (COUNT(prescription.prescription_id) >= " + numPresc + ");")
  output = cur.fetchall()
  results = []
  for i in output:
    print("output: ", i)
    results.append(i)
  return results



def getAverageAgeProceduresAndTest(conn, numPro, numTest):
  cur = conn.cursor()
  cur.execute("SELECT ROUND(SUM(TIMESTAMPDIFF(YEAR,  CAST(patient_dob AS DATE), CURDATE()))/COUNT(TIMESTAMPDIFF(YEAR,  CAST(patient_dob AS DATE), CURDATE()))) AS age FROM Patient patients JOIN Treatment_Plan treatments ON patients.patient_id = treatments.treatment_patient JOIN Procedure_Operation procedureOp ON treatments.treatment_procedure = procedureOp.procedure_id JOIN Testing_Service testing ON patients.patient_id = testing.testing_service_patient JOIN Healthcare_Provider hcp ON treatments.treatment_hcp = hcp.hcp_id JOIN Healthcare_Provider hcp2 ON testing.testing_service_hcp = hcp2.hcp_id WHERE (treatments.treatment_hcp = testing.testing_service_hcp) HAVING (COUNT(procedureOp.procedure_id) >= " + numPro + ") AND (COUNT(testing.testing_service_id) >= " + numTest + ");")
  output = cur.fetchall()
  results = []
  for i in output:
    print("output: ", i)
    results.append(i)
  return results

def getMedicines(conn, dollars, yearLowerBound, yearUpperBound):
  cur = conn.cursor()
  cur.execute("SELECT medicine_name AS 'Medicine', pharmacy_name AS 'Pharmacy' FROM Pharmacy pharm, Medicine meds JOIN Manufacturing manufacture ON meds.medicine_id = manufacture.med_id JOIN Pharmacy_Sales pharmSales ON meds.medicine_id = pharmSales.sale_medicine_id WHERE (pharmSales.sale_medicine_price < " + dollars + ") AND (manufacture.manufacture_date BETWEEN '" + yearLowerBound + "-01-01' AND '" + yearUpperBound + "-01-01') AND (pharm.pharmacy_id = pharmSales.sale_pharmacy_id)")
  output = cur.fetchall()
  results = []
  for i in output:
    print("output: ", i)
    results.append(i)
  return results

def getContracts(conn, contractLower, contractUpper, netWorth, medLower, medUpper):
  cur = conn.cursor()
  cur.execute("SELECT contract_id AS 'Contract ID', contract_start_date AS 'Start Date', contract_end_date AS 'End Date' FROM Contract JOIN Pharmaceutical_Company pharmCo ON Contract.pharmCom_id JOIN Pharmacy pharm ON Contract.pharmacyId = pharm.pharmacy_id JOIN Pharmacy_Sales pharmSales ON pharm.pharmacy_id = pharmSales.sale_pharmacy_id WHERE (Contract.pharmCom_id = pharmCo.pharmaceutical_id) AND (Contract.pharmacyId = pharm.pharmacy_id) AND (YEAR(Contract.contract_end_date) BETWEEN '" + contractLower + "' AND '" + contractUpper + "') AND (pharmCo.pharmaceutical_net_worth >= " + netWorth + ") AND (pharmSales.sale_medicine_price BETWEEN " + medLower + " AND " + medUpper + ");")
  output = cur.fetchall()
  results = []
  for i in output:
    print("output: ", i)
    results.append(i)
  return results

def getClinicPhoneNumbers(conn, yearLowerBound, yearUpperBound, numTreatment):
  cur = conn.cursor()
  cur.execute("SELECT clinic_name AS 'Clinic', clinic_phone_number AS 'Phone Number' FROM Clinic clinic JOIN Clinic_Workers workers ON clinic.clinic_id = workers.clinic_place_id JOIN Nurse nurses ON workers.clinic_nurse_id = nurses.nurse_id JOIN Employee employee ON nurses.nurse_employ_id = employee.employee_id JOIN Healthcare_Provider hcp ON workers.clinic_hcp_id = hcp.hcp_id JOIN Treatment_Plan treatment ON hcp.hcp_id = treatment.treatment_hcp WHERE (YEAR(employee.employee_start_date) BETWEEN '" + yearLowerBound + "' AND '" + yearUpperBound + "') AND (nurses.nurse_employ_id = employee.employee_id) AND (treatment.treatment_hcp = hcp.hcp_id) GROUP BY clinic_name, clinic_fax_number, clinic_phone_number HAVING (COUNT(treatment.treatment_id) >= " + numTreatment + ");")
  output = cur.fetchall()
  results = []
  for i in output:
    print("output: ", i)
    results.append(i)
  return results

  