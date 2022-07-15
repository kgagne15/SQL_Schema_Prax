DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    NPI VARCHAR(25) UNIQUE NOT NULL,
    specialty TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    mrn INT UNIQUE NOT NULL
);

CREATE TABLE doctor_patient (
    id SERIAL PRIMARY KEY,
    doctor_id INT UNIQUE NOT NULL REFERENCES doctors,
    patient_id INT UNIQUE NOT NULL REFERENCES patients
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    icd10 VARCHAR(15) NOT NULL,
    patient_id INT NOT NULL REFERENCES patients,
    doctor_id INT REFERENCES doctors
);

INSERT INTO doctors (first_name, last_name, NPI, specialty)
VALUES
('Temperance', 'Brennan', 0987654321, 'Orthopedics'),
('Maura', 'Isles', 1234567890, 'Forensic Pathology');

INSERT INTO patients (first_name, last_name, mrn)
VALUES
('Jane', 'Doe', 001),
('James', 'Bond', 007);


INSERT INTO doctor_patient (doctor_id, patient_id)
VALUES
(1, 1),
(2, 2);


INSERT INTO diagnoses (icd10, patient_id, doctor_id)
VALUES
('K40', 1, 1),
('F32.0', 1, 2),
('Z13.32', 2, 2);