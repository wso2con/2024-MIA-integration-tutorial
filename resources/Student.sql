CREATE DATABASE student;

use student;

create TABLE Student (
    id INT NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth DATE,
    address VARCHAR(500),
    degree VARCHAR(200),
    country VARCHAR(200),
    email VARCHAR(100),
    PRIMARY KEY(id)
);

desc Student;

create database wso2con_demo;
CREATE USER 'wso2'@'localhost' IDENTIFIED BY 'wso2con';
GRANT ALL ON Student.* TO 'wso2'@'localhost';

INSERT INTO Student (id, first_name, last_name, date_of_birth, address, degree, country, email) VALUES (101, "David", "Graham", "1991-12-01", "Park Street, New Jersey", "Electronics", "USA", "mshazninazeer@gmail.com");
INSERT INTO Student (id, first_name, last_name, date_of_birth, address, degree, country, email) VALUES (102, "Dennis", "Kruger", "1992-03-03", "One India Street, Boston", "Computer Science", "USA", "testusershazni@gmail.com");
INSERT INTO Student (id, first_name, last_name, date_of_birth, address, degree, country, email) VALUES (103, "Bill", "Joy", "1990-04-11", "Castro Street, Mountain View", "Computer Science", "USA", "mshazninazeer@yahoo.com");

SELECT * FROM Student;

select id, first_name, last_name, date_of_birth, address, degree from Student;
select id, first_name, last_name, date_of_birth, address, degree, country from Student where id = 101;

SELECT student_id, subject, grade, semester from Result where student_id = 102 and semester = 3;

UPDATE Student SET email="testusershazni@gmail.com" where id=102

DROP database result