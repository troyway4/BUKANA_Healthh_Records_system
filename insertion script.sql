
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~POPULATING TABLES WITH DATA ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

/*TO POPULATE RELATION  DISTRICT*/
INSERT INTO bukana.DISTRICT (district_id, name, region) VALUES('MSU','Maseru','Lowlands');
INSERT INTO bukana.DISTRICT (district_id, name, region) VALUES('LRB','Leribe','Lowlands');
INSERT INTO bukana.DISTRICT (district_id, name, region) VALUES('BB','Botha-Bothe','Lowlands');
INSERT INTO bukana.DISTRICT (district_id, name, region) VALUES('MKG', 'Mokhotlong', 'Highlands');
INSERT INTO bukana.DISTRICT (district_id, name, region) VALUES('QSK', 'Qacha s nek', 'Highlands');
INSERT INTO bukana.DISTRICT (district_id, name, region) VALUES('QUT', 'Quthing', 'Highlands');

/*TO POPULATE RELATION  HOSPITAL*/
INSERT INTO bukana.HOSPITAL (hospital_id, name, whatsApp_no, district_id) VALUES(777, 'Scott', 51711116, 'MSU');
INSERT INTO bukana.HOSPITAL (hospital_id, name, whatsApp_no, district_id) VALUES(888, 'Motebang', 51272227, 'LRB');
INSERT INTO bukana.HOSPITAL (hospital_id, name, whatsApp_no, district_id) VALUES(102, 'Seboche', 57766437, 'BB');
INSERT INTO bukana.HOSPITAL (hospital_id, name, whatsApp_no, district_id) VALUES(101, 'Botha-Bothe', 51444748, 'BB');
INSERT INTO bukana.HOSPITAL (hospital_id , name, whatsApp_no, district_id) VALUES(133, 'Quthing Hospital', 51666669, 'QUT');
INSERT INTO bukana.HOSPITAL (hospital_id , name, whatsApp_no, district_id) VALUES(171, 'Mokhotlong', 51444440, 'MKG');
INSERT INTO bukana.HOSPITAL (hospital_id , name, whatsApp_no, district_id) VALUES(191, 'Machabeng', 51666661, 'QSK');

/*TO POPULATE RELATION  DOCTOR*/
INSERT INTO bukana.DOCTOR (doctor_id, name, whatsApp_no, hospital_id)VALUES(999, 'Fane', 51337334, 777);
INSERT INTO bukana.DOCTOR (doctor_id, name, whatsApp_no, hospital_id)VALUES(101, 'Retshepile', 51444748, 888);
INSERT INTO bukana.DOCTOR (doctor_id, name, whatsApp_no, hospital_id)VALUES(121, 'Liabiloe', 51555859, 102);
INSERT INTO bukana.DOCTOR (doctor_id, name, whatsApp_no, hospital_id)VALUES(105, 'Katleho', 51666669, 131);
INSERT INTO bukana.DOCTOR (doctor_id, name, whatsApp_no, hospital_id)VALUES(109, 'Mothobi', 51444440, 171);
INSERT INTO bukana.DOCTOR (doctor_id, name, whatsApp_no, hospital_id)VALUES(110, 'Masilo', 51555559, 191);

/*TO POPULATE RELATION  nurse*/
INSERT INTO bukana.NURSE (nurse_id, name, whatsApp_no, hospital_id)VALUES(200, 'Lerato', 51337334, 777);
INSERT INTO bukana.NURSE (nurse_id, name, whatsApp_no, hospital_id)VALUES(201, 'Retshepile', 51444748, 888);
INSERT INTO bukana.NURSE (nurse_id, name, whatsApp_no, hospital_id)VALUES(202, 'Mpho', 51555859, 102);
INSERT INTO bukana.NURSE (nurse_id, name, whatsApp_no, hospital_id)VALUES(301, 'Mpholo', 51666669, 133);
INSERT INTO bukana.NURSE (nurse_id, name, whatsApp_no, hospital_id)VALUES(302, 'Papiki', 51444440, 171);
INSERT INTO bukana.NURSE (nurse_id, name, whatsApp_no, hospital_id)VALUES(303, 'Tlebere', 59752384, 191);

/*TO POPULATE RELATION  patient*/
INSERT INTO bukana.PATIENT (patient_id, name, whatsApp_no, district_id)VALUES(23, 'Tselane', 51337334, 'MSU');
INSERT INTO bukana.PATIENT(patient_id, name, whatsApp_no, district_id)VALUES(24, 'Makoetje',  51444748, 'LRB');
INSERT INTO bukana.PATIENT(patient_id, name, whatsApp_no, district_id)VALUES(25, 'Mpho', 51555859, 'BB');
INSERT INTO bukana.PATIENT(patient_id, name, whatsApp_no, district_id)VALUES(28, 'Ntori', 51666669, 'QUT');
INSERT INTO bukana.PATIENT(patient_id, name, whatsApp_no, district_id)VALUES(29, 'Bopaki',51444440, 'MKG');
INSERT INTO bukana.PATIENT(patient_id, name, whatsApp_no, district_id)VALUES(30, 'Nkoe', 51555559, 'QSK');

/*TO POPULATE RELATION  health_record*/
INSERT INTO bukana.HEALTH_RECORDS (record_id, patient_id, symptoms, medication, date)VALUES(23, 23, 'headache', 'aspirin', '2023-12-02 12:03:00');
INSERT INTO bukana.HEALTH_RECORDS(record_id, patient_id, symptoms, medication, date)VALUES(24, 24, 'Nausea and vomit', 'zofran', '2023-02-12 09:45:00');
INSERT INTO bukana.HEALTH_RECORDS(record_id, patient_id, symptoms, medication, date)VALUES(25, 25, 'Sore throat', 'Strepsils', '2023-02-12 10:23:00');
INSERT INTO bukana.HEALTH_RECORDS(record_id, patient_id, symptoms, medication, date)VALUES(281, 28, 'sore throat', 'Strepsils', '2023-02-12 15:57:00');
INSERT INTO bukana.HEALTH_RECORDS(record_id, patient_id, symptoms, medication, date)VALUES(291, 29, 'nausea', 'zofran', '2023-02-12 08:30:00');
INSERT INTO bukana.HEALTH_RECORDS(record_id, patient_id, symptoms, medication, date)VALUES(301, 30, 'headache', 'aspirin', '2023-02-12 17:23:00');

/*TO POPULATE RELATION  appointment*/
INSERT INTO bukana.APPOINTMENT (appointment_id, patient_id, doctor_id, date)VALUES(23, 23, 999,  '2023-02-12 13:00:00');
INSERT INTO bukana.APPOINTMENT(appointment_id, patient_id, doctor_id, date)VALUES(24, 24, 101,  '2023-02-12 14:00:00');
INSERT INTO bukana.APPOINTMENT(appointment_id, patient_id, doctor_id, date)VALUES(25, 25, 121,  '2023-02-12 15:00:00');
INSERT INTO bukana.APPOINTMENT(appointment_id, patient_id, doctor_id, date)VALUES(281, 28, 105, '2023-04-26 09:00:00');
INSERT INTO bukana.APPOINTMENT(appointment_id, patient_id, doctor_id, date)VALUES(291, 29, 109, '2023-02-12 10:00:00');
INSERT INTO bukana.APPOINTMENT(appointment_id, patient_id, doctor_id, date)VALUES(301, 30, 110, '2023-02-12 11:00:00');

/*/*TO POPULATE RELATION  user/*/
INSERT INTO bukana.USER (user_id, userName, password, district_id)VALUES(1, 'Tselane', '122333', 'MSU');
INSERT INTO bukana.USER(user_id, userName, password, district_id)VALUES(2, 'Katleho', '34324423', 'LRB');
INSERT INTO bukana.USER(user_id, userName, password, district_id)VALUES(3, 'Mpho', '3445253', 'BB');
INSERT INTO bukana.USER(user_id, userName, password, district_id)VALUES(7, 'Bopaki', '3424243', 'QUT');
INSERT INTO bukana.USER(user_id, userName, password, district_id)VALUES(8, 'Mothobi', '44343', 'MKG');
INSERT INTO bukana.USER(user_id, userName, password, district_id)VALUES(10, 'Tau', '555559', 'QSK');

