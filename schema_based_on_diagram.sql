/* Create Database */
CREATE DATABASE med_clinic
\c med_clinic

/* Create patients table */
CREATE TABLE patients (
id INT GENERATED ALWAYS AS IDENTITY,
name varchar(60),
date_of_birth date DATE,
PRIMARY KEY (id)
);

/* Create medical histories table */
CREATE TABLE medical_histories (
id INT GENERATED ALWAYS AS IDENTITY,
admitted_at TIMESTAMP,
patient_id INT,
status VARCHAR(30),
PRIMARY KEY (id),
FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE INDEX patient_id_asc ON medical_histories (patient_id ASC);

/* Create treatments table */
CREATE TABLE treatments (
Id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR (30),
name VARCHAR (50),
PRIMARY KEY (id)
);

/* Create invoices table */
CREATE TABLE invoices (
Id INT GENERATED ALWAYS AS IDENTITY,
total_amount NUMERIC (7, 2),
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT,
FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
PRIMARY KEY (id)
);

CREATE INDEX  medical_history_id_asc ON invoices(medical_history_id ASC);