/* EXPERIMENT 7.2 */

CREATE TABLE ORDERS(
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(100),
    AMOUNT DECIMAL(10,2)
);

INSERT INTO ORDERS VALUES (1, 'Aman', 5000.00);
INSERT INTO ORDERS VALUES (2, 'Riya', 15000.00);
INSERT INTO ORDERS VALUES (3, 'Karan', 8500.00);
INSERT INTO ORDERS VALUES (4, 'Simran', 25000.00);
INSERT INTO ORDERS VALUES (5, 'Rahul', 12000.00);
INSERT INTO ORDERS VALUES (6, 'Neha', 7000.00);



DECLARE
    CURSOR order_cursor IS
        SELECT ORDER_ID, AMOUNT
        FROM ORDERS;

    v_order_id ORDERS.ORDER_ID%TYPE;
    v_amount   ORDERS.AMOUNT%TYPE;

BEGIN
    OPEN order_cursor;

    LOOP
        FETCH order_cursor INTO v_order_id, v_amount;

        EXIT WHEN order_cursor%NOTFOUND;

        IF v_amount > 10000 THEN
            DBMS_OUTPUT.PUT_LINE(
                'Order ID: ' || v_order_id || ' - High Value'
            );
        END IF;
    END LOOP;

    CLOSE order_cursor;
END;
/