/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ RENAMING A KEYSPACE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
ALTER KEYSPACE bukana RENAME TO <new keyspacename>;


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TEST QUERIES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

SELECT * FROM bukana.HEALTH_RECORDS WHERE symptoms = 'sore throat' ALLOW FILTERING;/*execute  query despite this query despite the performance unpredictability by the allow filter ,gives patient appointment for sore throat;*/


UPDATE bukana.HEALTH_RECORDS SET medication = 'panado' WHERE WHERE record_id=23;/*change the medication for record_id=23*/

DELETE FROM bukana.appointment WHERE  appointment_id=23;/*delete the record*/
 select appointment_id from bukana.appointment where doctor_id=105 allow filtering;/*see if doctor with id =105 has any appointment*/


SELECT * FROM bukana.appointment WHERE doctor_id = 105 AND date >= '2023-04-24 00:00:00' AND date <= '2023-04-28 00:00:00' allow filtering;*
/*ssee the appointments for the doctor 105 in the timespan"*/

ALTER KEYSPACE bukana WITH replication = {'class':'NetworkTopologyStrategy', 'DC1':2, 'DC2':2};
/*the above and below commands allow us to change the replication foactors for keyspace*/
 ALTER KEYSPACE bukana WITH replication = {'class':'SimpleStrategy', 'replication_factor':1};

/*##########################################################################################################################################################
This query retrieves the names of patients, hospitals, doctors, and appointment dates for patients in the Maseru district. The query joins the PATIENT, APPOINTMENT, DOCTOR, and HOSPITAL tables based on their respective foreign keys. The result set includes the patient name, hospital name, doctor name, and appointment date.
##########################################################################################################################################################*/

SELECT bukana.PATIENT.name AS patient_name, bukana.HOSPITAL.name AS hospital_name, bukana.DOCTOR.name AS doctor_name,  bukana.APPOINTMENT.date AS appointment_date
FROM bukana.PATIENT 
JOIN bukana.APPOINTMENT  ON  bukana.PATIENT.patient_id = bukana.APPOINTMENT.patient_id
JOIN bukana.DOCTOR  ON bukana.DOCTOR.doctor_id = bukana.DOCTOR.doctor_id
JOIN bukana.HOSPITAL  ON bukana.DOCTOR.hospital_id = bukana.HOSPITAL.hospital_id
WHERE bukana.PATIENT.district_id = 'MSU' allow filtering;


/*##########################################################################################################################################################
This query joins together the DISTRICT, HOSPITAL, DOCTOR, NURSE, PATIENT, HEALTH_RECORDS, and APPOINTMENT tables. It calculates the total number of patients, appointments, and health records for each hospital in the Highlands region. The LEFT JOIN is used to include all hospitals, even those that have no patients or appointments. The GROUP BY clause groups the results by district and hospital name.
##########################################################################################################################################################*/

SELECT d.name AS district_name, h.name AS hospital_name, COUNT(DISTINCT p.patient_id) AS total_patients, 
       COUNT(DISTINCT a.appointment_id) AS total_appointments, COUNT(DISTINCT r.record_id) AS total_records
FROM learn_bukana.DISTRICT d
LEFT JOIN learn_bukana.HOSPITAL h ON d.district_id = h.district_id
LEFT JOIN learn_bukana.DOCTOR doc ON h.hospital_id = doc.hospital_id
LEFT JOIN learn_bukana.NURSE n ON h.hospital_id = n.hospital_id
LEFT JOIN learn_bukana.PATIENT p ON d.district_id = p.district_id
LEFT JOIN learn_bukana.HEALTH_RECORDS r ON p.patient_id = r.patient_id
LEFT JOIN learn_bukana.APPOINTMENT a ON p.patient_id = a.patient_id AND doc.doctor_id = a.doctor_id
WHERE d.region = 'Highlands'
GROUP BY d.name, h.name allow filtering;


/*##########################################################################################################################################################
This query retrieves the name of a patient, the name of the hospital where their appointment is scheduled, the name of the district where the hospital is located, and the appointment date for a patient with the WhatsApp number 51555859. It does this by joining the PATIENT, APPOINTMENT, DOCTOR, and HOSPITAL tables on their respective foreign keys, filtering the results to only include appointments for the specified patient.
##########################################################################################################################################################*/

SELECT p.name, h.name AS hospital_name, d.name AS district_name, a.date AS appointment_date
FROM learn_bukana.PATIENT p
JOIN learn_bukana.APPOINTMENT a ON p.patient_id = a.patient_id
JOIN learn_bukana.DOCTOR d ON a.doctor_id = d.doctor_id
JOIN learn_bukana.HOSPITAL h ON d.hospital_id = h.hospital_id
WHERE p.whatsApp_no = 51555859 allow filtering;


/*##########################################################################################################################################################
To count the number of nurses who updated health records this week, together with their names and numbers in a certain hospital
##########################################################################################################################################################*/

SELECT n.name, n.whatsApp_no, COUNT(*) as num_records_updated
FROM bukana.NURSE n
JOIN bukana.HEALTH_RECORDS h ON n.hospital_id = h.hospital_id
WHERE h.date >= date_trunc('week', NOW()) AND h.date < date_trunc('week', NOW()) + INTERVAL '1 week'
GROUP BY n.name, n.whatsApp_no allow filtering;







