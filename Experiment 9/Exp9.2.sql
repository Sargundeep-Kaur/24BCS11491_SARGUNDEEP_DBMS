CREATE TABLE employee2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    per_hour_salary NUMERIC(10,2),
    working_hours NUMERIC(10,2),
    payable_amount NUMERIC(10,2)
);

INSERT INTO employee2
(emp_id, emp_name, per_hour_salary, working_hours, payable_amount)
VALUES
(101, 'Amit', 500, 8, 0),
(102, 'Rahul', 60, 7, 0),
(103, 'Priya', 550, 9, 0);

SELECT * FROM employee2;

CREATE OR REPLACE FUNCTION cal_payable()
RETURNS TRIGGER
AS
$$
BEGIN
    NEW.payable_amount = NEW.working_hours * NEW.per_hour_salary;

    IF NEW.payable_amount > 25000 THEN
        RAISE EXCEPTION 'PAYABLE AMOUNT GREATER THAN 25000 NOT ALLOWED';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER cal_payableamt
BEFORE INSERT OR UPDATE
ON employee2
FOR EACH ROW
EXECUTE FUNCTION cal_payable();


CREATE OR REPLACE FUNCTION print_msg()
RETURNS TRIGGER
AS
$$
BEGIN
    RAISE NOTICE 'ROWS UPDATED SUCCESSFULLY';
    RETURN NULL;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER print_msg
AFTER INSERT OR UPDATE
ON employee2
FOR EACH STATEMENT
EXECUTE FUNCTION print_msg();

INSERT INTO employee2
(emp_id, emp_name, per_hour_salary, working_hours, payable_amount)
VALUES
(104, 'Neha', 100, 8, 0);
SELECT * FROM employee2;
