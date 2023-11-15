--  Stworzyæ blok anonimowy wypisuj¹cy zmienn¹ numer_max równ¹ maksymalnemu numerowi Departamentu 
--  i dodaj do tabeli departamenty – departament z numerem o 10 wiekszym, typ pola dla zmiennej 
--  z nazw¹ nowego departamentu (zainicjowaæ na EDUCATION) ustawiæ taki jak dla pola 
--  department_name w tabeli (%TYPE)

--DECLARE
--    numer_max NUMBER := 0;
--    new_department_name departments.department_name%TYPE;
--BEGIN
--    select MAX(department_id) into numer_max FROM departments;
--    numer_max := numer_max + 10;
--    new_department_name := 'Education';
--    dbms_output.put_line(numer_max);
--    INSERT INTO departments(department_id,department_name)
--    VALUES(numer_max, new_department_name);
--END;

--Do poprzedniego skryptu dodaj instrukcje zmieniaj¹c¹ location_id (3000) dla dodanego departamentu  

--DECLARE
--    numer_max NUMBER := 0;
--    new_department_name departments.department_name%TYPE;
--BEGIN
--    select MAX(department_id) into numer_max FROM departments;
--    numer_max := numer_max;
--    new_department_name := 'Education';
----    dbms_output.put_line(numer_max);
----    INSERT INTO departments(department_id,department_name)
----    VALUES(numer_max, new_department_name);
--    UPDATE departments
--    SET location_id = 3000
--    WHERE department_id = numer_max;
--END;

-- Stwórz tabelê nowa z jednym polem typu varchar 
-- a nastêpnie wpisz do niej za pomoc¹ pêtli liczby od 1 do 10 bez liczb 4 i 6

--CREATE TABLE z3(field VARCHAR(2));
--BEGIN
--    FOR i IN 1..10 
--    loop
--        IF i = 4 or i = 6 then
--            continue;
--        ELSE
--            INSERT INTO z3(field)
--            VALUES(i);
--        END IF;
--    END LOOP;
--END;

--Wyci¹gn¹æ informacje z tabeli countries do jednej zmiennej (%ROWTYPE) 
--dla kraju o identyfikatorze ‘CA’. Wypisaæ nazwê i region_id na ekran

--DECLARE 
--    cou_rec countries%ROWTYPE;
--    cou_id  countries.country_id%TYPE := 'CA';
--BEGIN
--    SELECT * INTO cou_rec
--    FROM countries
--    WHERE country_id = cou_id;
--    dbms_output.put_line(cou_rec.region_id || ', ' || cou_rec.country_name);
--END;

--DECLARE
--    CURSOR c_depart is
--        SELECT department_name FROM departments;
--    
--    TYPE type_department IS TABLE OF departments.department_name%type INDEX BY binary_integer;
--    departs_ids type_department;
--    
--    counter integer := 0;
--BEGIN
--    FOR x IN c_depart LOOP
--        counter := counter + 10;
--        departs_ids(counter) := x.department_name;
--        dbms_output.put_line(departs_ids(counter));
--        
--        IF counter >= 100 THEN
--            exit;
--        END IF;
--    END LOOP;
--END;

DECLARE
    CURSOR c_depart IS
        SELECT * FROM departments;
    
    TYPE type_department IS TABLE OF departments%ROWTYPE INDEX BY binary_integer;
    departs_ids type_department;
    
    counter integer := 0;
BEGIN
    FOR x IN c_depart LOOP
        counter := counter + 10;
        departs_ids(counter) := x;
        
        -- Displaying information for each department
        dbms_output.put_line('Department ID: ' || departs_ids(counter).department_id);
        dbms_output.put_line('Department Name: ' || departs_ids(counter).department_name);
        dbms_output.put_line('Manager ID: ' || departs_ids(counter).manager_id);
        dbms_output.put_line('Location ID: ' || departs_ids(counter).location_id);
        dbms_output.put_line('--------------------------------------');
        
        IF counter >= 100 THEN
            exit;
        END IF;
    END LOOP;
END;

--DECLARE
--    CURSOR c_employee is
--        SELECT last_name, salary
--        FROM employees
--        WHERE department_id = 50;
--BEGIN
--    FOR x IN c_employee LOOP
--        IF x.salary > 3100 THEN
--            dbms_output.put_line(x.last_name || '-' || 'Nie dawaæ podwy¿ki');
--        ELSE
--            dbms_output.put_line(x.last_name || '-' || 'Daæ podwy¿kê');
--        END IF;
--    END LOOP;
--END;

--DECLARE
--    CURSOR c_employee IS
--        SELECT first_name, last_name, salary
--        FROM employees
--        WHERE salary>&min_salary AND salary<&max_salary AND LOWER(first_name) LIKE LOWER('%&letter%');
-- BEGIN
--    FOR x IN c_employee LOOP
--        dbms_output.put_line(x.first_name || ' ' || x.last_name || ' - ' || x.salary);
--    END LOOP;
--END;   
--
--DECLARE
--    CURSOR c_employee IS
--        SELECT first_name, last_name, salary
--        FROM employees
--        WHERE salary>1000 AND salary<5000 AND LOWER(first_name) LIKE '%a%';
-- BEGIN
--    FOR x IN c_employee LOOP
--        dbms_output.put_line(x.first_name || ' ' || x.last_name || ' - ' || x.salary);
--    END LOOP;
--END;   
--
--DECLARE
--    CURSOR c_employee IS
--        SELECT first_name, last_name, salary
--        FROM employees
--        WHERE salary>5000 AND salary<20000 AND LOWER(first_name) LIKE '%u%';
-- BEGIN
--    FOR x IN c_employee LOOP
--        dbms_output.put_line(x.first_name || ' ' || x.last_name || ' - ' || x.salary);
--    END LOOP;
--END;  

--create or replace PROCEDURE AddJob(
--    p_job_id IN VARCHAR2,
--    p_job_name IN VARCHAR2)
--    AS
--BEGIN
--    INSERT INTO jobs(job_id, job_title) VALUES(p_job_id, p_job_name);
--EXCEPTION
--    WHEN DUP_VAL_ON_INDEX THEN
--      raise_application_error (-20001,'Istnieje ju¿ praca z takim id');
--    WHEN OTHERS THEN
--        raise_application_error (-20002,'Niepoprawnie u¿yta procedura');
--END AddJob;

--EXECUTE AddJob('co_flat', 'Conservator of flat surfaces');
--EXECUTE AddJob('co_flat', 'Cleaner');

--CREATE OR REPLACE PROCEDURE ChangeTitleJob(
--    p_job_id IN VARCHAR2,
--    p_job_name IN VARCHAR2)
--is
--    l_numb number;
--    E_NULL_ID Exception;
--BEGIN
--    SELECT COUNT(*) INTO l_numb
--    FROM jobs
--    WHERE job_id = p_job_id;
--    
--    IF l_numb <= 0 THEN
--        raise E_NULL_ID;
--    END IF;
--
--    UPDATE jobs
--    SET job_title = p_job_name
--    WHERE job_id = p_job_id;
--exception
--    WHEN E_NULL_ID THEN
--        raise_application_error (-20001,'Nie istnieje takie ID');
--    WHEN OTHERS THEN
--        raise_application_error (-20002,'Niepoprawnie u¿yta procedura');
--END ChangeTitleJob;
--
--EXECUTE ChangeTitleJob('xx_xxxxxxx', 'No');
--EXECUTE ChangeTitleJob('co_flat', 'Cleaner');

--CREATE OR REPLACE PROCEDURE DeleteJob(
--    p_job_id IN VARCHAR2)
--is
--    l_numb number;
--    E_NULL_ID Exception;
--BEGIN
--    SELECT COUNT(*) INTO l_numb
--    FROM jobs
--    WHERE job_id = p_job_id;
--    
--    IF l_numb <= 0 THEN
--        raise E_NULL_ID;
--    END IF;
--
--    DELETE FROM jobs
--    WHERE job_id = p_job_id;
--exception
--    WHEN E_NULL_ID THEN
--        raise_application_error (-20001,'Nie istnieje takie ID');
--    WHEN OTHERS THEN
--        raise_application_error (-20002,'Niepoprawnie u¿yta procedura');
--END DeleteJob;
--
--EXECUTE DeleteJob('xx_xxxxxxx');
--EXECUTE DeleteJob('co_flat');

--CREATE OR REPLACE PROCEDURE GetNameAndSalary(
--    p_employee_id IN number)
--is
--    l_numb number;
--    E_NULL_ID Exception;
--    p_result varchar2(50);
--BEGIN
--    SELECT COUNT(*) INTO l_numb
--    FROM EMPLOYEES
--    WHERE employee_id = p_employee_id;
--    
--    IF l_numb <= 0 THEN
--        raise E_NULL_ID;
--    END IF;
--    
--    SELECT CONCAT(CONCAT(last_name, ' ') ,salary) into p_result
--    FROM EMPLOYEES
--    WHERE employee_id = p_employee_id;
--    dbms_output.put_line(p_result);
--exception
--    WHEN E_NULL_ID THEN
--        raise_application_error (-20001,'Nie istnieje takie ID');
--    WHEN OTHERS THEN
--        raise_application_error (-20002,'Niepoprawnie u¿yta procedura');
--END GetNameAndSalary; 
    
--EXECUTE GetNameAndSalary(101);

create sequence seq_next_id
    MINVALUE 207
    MAXVALUE 99999
    START WITH 207
    INCREMENT BY 1;

SELECT seq_next_id.nextval FROM dual;

create or replace PROCEDURE AddEmployee(
    p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_salary in number)
IS
    E_BIG_SALARY Exception;
    l_next_id number;
    l_mail varchar2(50);
BEGIN
    IF p_salary > 20000 THEN
        raise E_BIG_SALARY;
    END IF;
    
    l_mail := CONCAT(UPPER(SUBSTR(p_first_name, 0, 1)), UPPER(p_last_name));
    
    INSERT INTO EMPLOYEES(employee_id, first_name, last_name, email, salary, job_id, hire_date) 
    VALUES(seq_next_id.nextval, p_first_name, p_last_name, l_mail, p_salary, 'MK_MAN', CURRENT_DATE);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      raise_application_error (-20001,'Istnieje ju¿ praca z takim id');
    WHEN E_BIG_SALARY THEN
      raise_application_error (-20000,'Za du¿e wynagrodzenie');
END AddEmployee;

EXECUTE AddEmployee('Andrzej', 'Sapkowski', 120000);
EXECUTE AddEmployee('Andrzej', 'Sapkowski', 10000);