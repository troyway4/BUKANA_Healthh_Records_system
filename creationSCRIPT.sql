/*BELOW WE CREATE THE GCS OF THE BUKANA PATIENT RECORD SYSTEM*/
CREATE KEYSPACE bukana WITH replication = {'class': 'NetworkTopologyStrategy', 'datacenter1' : 2}; /*KEYSPACE TO HOLD THE TABLES*/

/*BELOW WE DEFINE THE TABLES IN THE KESPACE BUKANA*/
CREATE TABLE bukana.DISTRICT (district_id text , name text, region text, PRIMARY KEY (district_id));
CREATE TABLE bukana.HOSPITAL (hospital_id int, name text, whatsApp_no bigint, district_id text, PRIMARY KEY (hospital_id));
CREATE TABLE bukana.DOCTOR (doctor_id int, name text, whatsApp_no bigint, hospital_id int, PRIMARY KEY (doctor_id));
CREATE TABLE bukana.NURSE (nurse_id int, name text, whatsApp_no bigint, hospital_id int, PRIMARY KEY (nurse_id));
CREATE TABLE bukana.PATIENT (patient_id int, name text, whatsApp_no bigint, district_id text, PRIMARY KEY (patient_id));
CREATE TABLE bukana.HEALTH_RECORDS (record_id int,patient_id int,symptoms text, medication text,date timestamp, PRIMARY KEY (record_id));
CREATE TABLE bukana.APPOINTMENT (appointment_id int, patient_id int, doctor_id int,date timestamp,PRIMARY KEY (appointment_id));
CREATE TABLE bukana.USER (user_id int,userName text,password text,district_id text,PRIMARY KEY (user_id)); 


/*AFTER THE CREATION WE CAN CHECK THE CREATION BY //DESCRIBE tables;*/


/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ TO DROP THE TABLES WE CAN USE DROP TABLES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

DROP TABLE bukana.DISTRICT;
DROP TABLE bukana.HOSPITAL;
DROP TABLE bukana.DOCTOR;
DROP TABLE bukana.NURSE;
DROP TABLE bukana.PATIENT;
DROP TABLE bukana.HEALTH_RECORDS;
DROP TABLE bukana.APPOINTMENT;
DROP TABLE bukana.USER;
