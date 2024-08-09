CREATE OR REPLACE PROCEDURE AddNewCustomer(
    p_customer_id IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER
) IS
BEGIN

    BEGIN
        INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
        VALUES (p_customer_id, p_name, p_dob, p_balance, SYSDATE);
        
        
        COMMIT;
        
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            
            DBMS_OUTPUT.PUT_LINE('Error: Customer with ID ' || p_customer_id || ' already exists.');
            ROLLBACK;
        WHEN OTHERS THEN
            
            DBMS_OUTPUT.PUT_LINE('Error occurred while adding new customer: ' || SQLERRM);
            ROLLBACK;
    END;
END;
/
