--------------------------------- SQL DATABASE ----------------------------------

-- Create a new database called "School" this database should have two tables: teachers and students.
-- The students table should have columns for student_id, first_name,last_name, homeroom_number, phone,email, and graduation year.
-- The teachers table should have columns for teacher_id, first_name, last_name, homeroom_number, department, email, and phone.
-- The constraints are mostly up to you, but your table constraints do have to consider the following:
-- We must have a phone number to contact students in case of an emergency.
-- We must have ids as the primary key of the tables
-- Phone numbers and emails must be unique to the individual.

-- Creating school database.
--CREATE DATABASE School;

--Creating students' table
CREATE TABLE students (
	
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER,
	phone VARCHAR(200) UNIQUE NOT NULL,
	email VARCHAR(50) UNIQUE,
	grad_year INTEGER
);

-- Creating 'teachers' table.
CREATE TABLE teachers(
	
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER,
	department VARCHAR(50),
	email VARCHAR(50) UNIQUE, 
	phone VARCHAR(200) UNIQUE
);

SELECT * FROM students;
SELECT * FROM teachers;

-- Insert values into the 'students' table.
INSERT INTO students(student_id, first_name, last_name, homeroom_number, phone, grad_year)
VALUES (1, 'Mark', 'Watney', 5, '777-555-1234', 2035);

-- Insert values into 'teachers' table.
INSERT INTO teachers(teacher_id, first_name, last_name, homeroom_number, department, email, phone)
VALUES (1, 'Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org', '777-555-4321');

-- Shows the 'teachers' table information.
SELECT * FROM teachers;
