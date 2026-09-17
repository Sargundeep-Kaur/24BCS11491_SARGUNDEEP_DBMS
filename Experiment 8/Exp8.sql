CREATE TABLE Employee (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(100),
    SALARY NUMERIC(10,2),
    DEPARTMENT_NAME VARCHAR(100)
);

CREATE OR REPLACE PROCEDURE Insert_Employee(
    EMP_ID INT,
    EMP_NAME VARCHAR(100),
    SALARY NUMERIC(10,2),
    DEPARTMENT_NAME VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
    
    IF EMP_ID % 2 = 0 THEN
        RAISE EXCEPTION 'Even EMP_ID is not allowed. Only odd EMP_ID is allowed.';
    ELSE
       
        INSERT INTO Employee
        VALUES (EMP_ID, EMP_NAME, SALARY, DEPARTMENT_NAME);

       
        RAISE NOTICE 'Employee inserted successfully.';
    END IF;
END;
$$;


CALL Insert_Employee(
    101,
    'Rahul',
    50000,
    'IT'
);

SELECT * FROM Employee;

CALL Insert_Employee(
    102,
    'Aman',
    45000,
    'HR'
);