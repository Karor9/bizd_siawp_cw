CREATE TABLE JOBS(job_id INT,
    job_title varchar2(50),
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2));

ALTER TABLE JOBS
    ADD PRIMARY KEY(job_id);

CREATE TABLE REGIONS(region_id INT,
    region_name varchar2(50));

ALTER TABLE REGIONS
    ADD PRIMARY KEY(region_id);

CREATE TABLE COUNTRIES(country_id INT,
    country_name varchar2(50),
    region_id INT);

ALTER TABLE COUNTRIES
    ADD PRIMARY KEY(country_id);

ALTER TABLE COUNTRIES
    ADD FOREIGN KEY (region_id) REFERENCES REGIONS(region_id);

CREATE TABLE LOCATIONS(location_id INT,
    street_address varchar2(100),
    postal_code varchar2(6),
    city varchar2(50),
    state_province varchar2(100),
    country_id INT);

ALTER TABLE LOCATIONS
    ADD PRIMARY KEY (location_id);

ALTER TABLE LOCATIONS
    ADD FOREIGN KEY (country_id) REFERENCES COUNTRIES(country_id);

CREATE TABLE DEPARTMENTS(department_id INT,
    department_name varchar2(100),
    manager_id INT,
    location_id INT)

ALTER TABLE DEPARTMENTS
        ADD PRIMARY KEY(department_id);

CREATE TABLE JOB_HISTORY(employee_id INT,
    start_date DATE,
    end_date DATE,
    job_id INT,
    department_id INT);
    
ALTER TABLE JOB_HISTORY
    ADD CONSTRAINT PK_job_history PRIMARY KEY(employee_id, start_date);

ALTER TABLE JOB_HISTORY
    ADD FOREIGN KEY (job_id) REFERENCES JOBS(job_id);

ALTER TABLE JOB_HISTORY
    ADD FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id);

CREATE TABLE EMPLOYEES(employee_id INT,
    first_name varchar2(50),
    last_name varchar2(50),
    email varchar2(100),
    phone_number varchar2(15),
    hire_data DATE,
    job_id INT,
    salary DECIMAL(10,2),
    commission_pct varchar2(50),
    manager_id INT,
    department_id INT);
    
ALTER TABLE EMPLOYEES
    ADD PRIMARY KEY(employee_id);

ALTER TABLE DEPARTMENTS
    ADD FOREIGN KEY (location_id) REFERENCES LOCATIONS(location_id);

ALTER TABLE JOB_HISTORY
    ADD FOREIGN KEY (employee_id) REFERENCES EMPLOYEES(employee_id);

ALTER TABLE DEPARTMENTS
    ADD FOREIGN KEY (manager_id) REFERENCES EMPLOYEES(employee_id);

ALTER TABLE EMPLOYEES
--    ADD FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id);

ALTER TABLE EMPLOYEES
    ADD FOREIGN KEY (manager_id) REFERENCES EMPLOYEES(employee_id);

ALTER TABLE EMPLOYEES
    ADD FOREIGN KEY (job_id) REFERENCES JOBS(job_id);

ALTER TABLE JOBS
   ADD CONSTRAINT CHK_salary CHECK (max_salary + 2000 > min_salary);

DROP TABLE JOB_HISTORY; 

FLASHBACK TABLE JOB_HISTORY TO BEFORE DROP;

ALTER TABLE JOB_HISTORY
    ADD CONSTRAINT PK_job_history PRIMARY KEY(employee_id, start_date);

ALTER TABLE JOB_HISTORY
    ADD FOREIGN KEY (job_id) REFERENCES JOBS(job_id);

ALTER TABLE JOB_HISTORY
    ADD FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id);

ALTER TABLE JOB_HISTORY
    ADD FOREIGN KEY (employee_id) REFERENCES EMPLOYEES(employee_id);

ALTER TABLE JOBS
   DROP CONSTRAINT CHK_salary;

ALTER TABLE JOBS
   ADD CONSTRAINT CHK_salary CHECK (min_salary + 2000 < max_salary);