Vanessa Van Dinh
917519192

Discord Invite Link:
https://discord.gg/3eAbRjGwUZ

Repl Join Link:
https://replit.com/join/zzygtjdhhn-vandinhvanessa

Commands to the Business Rules
1. /get-account-profiles insurance (year lower bound) & (year upper bound) payments > (number)
2. /get-patient-appointments hcp procedure (year lower bound) & (year upper bound)
3. /get-pharmacy-sales-all-contracts
4. /get-procedures-average-age patients > (age) prescriptions > (number)
5. /get-patient-age average (number of procedures) < procedures (number of testing services) < testing
6. /get-pharmacy-sales medicines < ($dollars) (year lower bound) & (year upper bound)
7. /get-contracts (year lower bound) & (year upper bound) company > ($dollars) sales ($dollars lower bound) & ($dollars upper bound)
8. /get-phone-numbers clinics nurses start (year lower bound) & (year upper bound) hcp procedures > (number of procedures)

For examples of the commands please refer to the #testing channel on the Discord Server

Business Requirements
1. Find the account profiles that have insurance plans issued to them between X year and Y year, and where those insurance plans have paid for at least one bill.
2. For each patient, find their previous appointments that has been with a healthcare provider that has given them a procedure in the past X years.
3. For each pharmacy, find the total amounts of medicine sales from each pharmaceutical company it is contracted with.
4. Find the procedures where the average age of the patients was over a certain age and the patients have had at least X prescriptions within the past year.
5. Find the average age of patients who have had at least X procedures by the same healthcare provider and has had at least Y testing services done.
6. Find all the medicines have been sold by each pharmacy that costs under a certain amount and has been manufactured between X year and Y year.
7. Find the non-expired contracts between X year and Y year where the contracted pharmaceutical company is worth at least (A) dollars and the contracted pharmacy 
sold the medicine products between $B and $C.
8. Find the phone numbers of all the clinics where the year the nurses started working is between X and Y year, and where the healthcare providers working at that 
clinic have performed at least Z procedures.

NOTE: uploaded new inserts.sql file because I modified some values, but original databasefile.sql is same.
