/* Create Database */
CREATE DATABASE med_clinic \ c med_clinic
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
CREATE INDEX medical_history_id_asc ON invoices(medical_history_id ASC);
/* Create invoice_item table */
CREATE TABLE invoice_item (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price NUMERIC (7, 2),
    quantity INT,
    total_price NUMERIC (7, 2),
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
CREATE INDEX invoice_id_asc ON invoice_item(invoice_id ASC);
CREATE INDEX treatment_id_asc invoice_item(treatment_id ASC);
CREATE TABLE history_treatment (
    medical_histories_id INT,
    treatments_id INT,
    PRIMARY KEY (medical_histories_id, treatments_id),
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatments_id) REFERENCES treatments(id)
);
CREATE INDEX medical_histories_id_asc ON history_treatment (medical_histories_id ASC);
CREATE INDEX treatment_id_asc ON history_treatment (treatment_id ASC);