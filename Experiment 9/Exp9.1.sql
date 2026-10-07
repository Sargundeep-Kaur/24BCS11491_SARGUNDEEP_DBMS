-- 1. Create Salary_Hike table
CREATE TABLE Salary_Hike (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(100),
    SALARY NUMERIC(10,2)
);



CREATE OR REPLACE FUNCTION check_salary_hike()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

   
    IF NEW.SALARY > OLD.SALARY * 1.15 THEN

        RAISE EXCEPTION
        'Salary increase cannot exceed 15%% of the old salary.';

    END IF;

    RETURN NEW;

END;
$$;



CREATE OR REPLACE TRIGGER salary_hike_before_update
BEFORE UPDATE ON Salary_Hike
FOR EACH ROW
EXECUTE FUNCTION check_salary_hike();