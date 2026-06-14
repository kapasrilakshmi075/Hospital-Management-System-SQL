---creating tables---
---Departments Table---
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);
SELECT * FROM departments;
---Doctors Table---
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);
SELECT * FROM doctors;
----Patients Table---
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    blood_group VARCHAR(5)
);
SELECT * FROM patients;
---Appointments Table---
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(30),
    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id)
);
SELECT * FROM appointments;
---Treatments Table---
CREATE TABLE treatments (
    treatment_id SERIAL PRIMARY KEY,
    appointment_id INT,
    diagnosis TEXT,
    treatment_details TEXT,
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id)
        REFERENCES Appointments(appointment_id)
);
SELECT * FROM treatments;
---Bills Table---
CREATE TABLE bills (
    bill_id SERIAL PRIMARY KEY,
    patient_id INT,
    treatment_id INT,
    bill_date DATE,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),
    FOREIGN KEY (treatment_id)
        REFERENCES Treatments(treatment_id)
);
SELECT * FROM bills;
---Medicines Table---
CREATE TABLE medicines (
    medicine_id SERIAL PRIMARY KEY,
    medicine_name VARCHAR(100),
    manufacturer VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT
);
SELECT * FROM medicines;
---Prescriptions Table---
CREATE TABLE prescriptions (
    prescription_id SERIAL PRIMARY KEY,
    treatment_id INT,
    medicine_id INT,
    dosage VARCHAR(100),
    duration VARCHAR(50),
    instructions TEXT,
    FOREIGN KEY (treatment_id)
        REFERENCES Treatments(treatment_id),
    FOREIGN KEY (medicine_id)
        REFERENCES Medicines(medicine_id)
);
SELECT * FROM prescriptions;

