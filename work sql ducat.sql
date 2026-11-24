
DROP DATABASE IF EXISTS interview_commands_practice;
CREATE DATABASE interview_commands_practice;
USE interview_commands_practice;

SET autocommit = 1;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(60) NOT NULL,
    department VARCHAR(30) NOT NULL,
    city VARCHAR(40),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    employment_status ENUM('Active', 'Inactive') DEFAULT 'Active',
    phone VARCHAR(15) UNIQUE
) ENGINE = InnoDB;

INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
    (1, 'Rahul Sharma', 'IT', 'Delhi', 45000.00, 'Active', '9000000001'),
    (2, 'Priya Verma', 'HR', 'Mumbai', 42000.00, 'Active', '9000000002'),
    (3, 'Amit Patel', 'Sales', 'Ahmedabad', 38000.00, 'Inactive', '9000000003'),
    (4, 'Anjali Singh', 'IT', 'Kolkata', 50000.00, 'Active', '9000000004'),
    (5, 'Vijay Kumar', 'Finance', 'Bangalore', 55000.00, 'Active', '9000000005'),
    (6, 'Sanjay Reddy', 'Sales', 'Hyderabad', 36000.00, 'Active', '9000000006'),
    (7, 'Megha Iyer', 'IT', 'Chennai', 48000.00, 'Active', '9000000007'),
    (8, 'Neha Gupta', 'HR', 'Delhi', 32000.00, 'Inactive', '9000000008'),
    (9, 'Arjun Mehta', 'Finance', 'Pune', 52000.00, 'Active', '9000000009'),
    (10, 'Pooja Shah', 'Sales', 'Mumbai', 40000.00, 'Active', '9000000010');
    
    -- (1)
    INSERT INTO employees
(employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
(11, 'Karan Malhotra', 'IT', 'Noida', 41000.00, 'Active', '9000000011');
select * from employees;

-- (2)
INSERT INTO employees
(employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
(12, 'Simran Kaur', 'HR', 'Delhi', 35000.00, 'Active', '9000000012'),
(13, 'Rohan Das', 'Sales', 'Pune', 33000.00, 'Inactive', '9000000013');
select * from employees;

-- (3)
UPDATE employees
SET city = 'Gurgaon',
    salary = 46000.00
WHERE employee_id = 11;
select * from employees;

-- (4)
UPDATE employees
SET salary = salary * 1.10
WHERE employee_id IN (1, 4, 7);
select * from employees;

-- (5)
DELETE FROM employees
WHERE employee_id IN (3, 8, 13);
select * from employees;

-- (6)
ALTER TABLE employees
ADD COLUMN email VARCHAR(100) NULL;
desc employees;

-- (7)
ALTER TABLE employees
MODIFY COLUMN phone VARCHAR(20) NULL;
desc employees;

-- (8)
ALTER TABLE employees
CHANGE COLUMN city work_city VARCHAR(40);
desc employees;

-- (9)
ALTER TABLE employees
DROP COLUMN email;
desc employees;

-- (10)
RENAME TABLE employees TO staff;
SHOW TABLES;
select * from staff;

-- (11)
START TRANSACTION;
INSERT INTO staff
(employee_id, employee_name, department, work_city, salary, employment_status, phone)
VALUES
(14, 'Nisha Rao', 'IT', 'Noida', 44000.00, 'Active', '9000000014');
-- (A)
UPDATE staff
SET salary = 45000.00
WHERE employee_id = 2;
commit;
rollback;
SELECT * FROM staff
WHERE employee_id IN (2, 14);

-- (12)
START TRANSACTION;
UPDATE staff
SET salary = 60000.00
WHERE employee_id = 5;

DELETE FROM staff
WHERE employee_id = 6;

rollback;
select * from staff;

-- (13)
-- (a)
update staff
set salary = 47000.00
where employee_id=14;
savepoint salary_saved;

-- (b)
update staff
set work_city ='Jaipur'
where employee_id=14;
savepoint city_saved;

-- (c)
delete from staff
where employee_id = 14;
rollback to city_saved;
 
-- (d)
COMMIT;
select employee_id , employee_name , salary, work_city from staff
where employee_id =14;

-- (14)
START TRANSACTION;
TRUNCATE TABLE staff;
ROLLBACK;
SELECT * FROM staff; 
describe staff;

-- (15)
DROP TABLE staff;
DROP DATABASE  interview_commands_practice;
SHOW TABLES;
SHOW DATABASES;