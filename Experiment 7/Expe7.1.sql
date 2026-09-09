/* EXPERIMENT 7.1 */


CREATE TABLE STAFF(
    ID INT PRIMARY KEY,
    S_NAME VARCHAR(100),
    SALARY DECIMAL(10,2)
);

INSERT INTO STAFF VALUES (1, 'Bhupendra Singh', 50000.00);
INSERT INTO STAFF VALUES (2, 'Rakesh Kumar', 38500.00);
INSERT INTO STAFF VALUES (3, 'Sartaaj Singh', 45200.00);
INSERT INTO STAFF VALUES (4, 'Raj Singh', 70000.00);
INSERT INTO STAFF VALUES (5, 'Dilip Kumar', 60000.00);
INSERT INTO STAFF VALUES (6, 'Gurdev Singh', 32000.00);
INSERT INTO STAFF VALUES (7, 'Manish Thakur', 45000.00);
INSERT INTO STAFF VALUES (8, 'Harkishan', 55600.00);


DECLARE
    CURSOR staff_cursor IS
        SELECT S_NAME, SALARY
        FROM STAFF
        ORDER BY SALARY DESC;

    v_name STAFF.S_NAME%TYPE;
    v_salary STAFF.SALARY%TYPE;
    v_count NUMBER := 0;

BEGIN
    OPEN staff_cursor;

    LOOP
        FETCH staff_cursor INTO v_name, v_salary;

        EXIT WHEN staff_cursor%NOTFOUND OR v_count = 5;

        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || 
                             '  Salary: ' || v_salary);

        v_count := v_count + 1;
    END LOOP;

    CLOSE staff_cursor;
END;
/
