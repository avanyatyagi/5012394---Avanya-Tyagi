ALTER TABLE Customers ADD IsVIP CHAR(1) DEFAULT 'N';

BEGIN
    FOR rec IN (SELECT CustomerID, Balance FROM Customers) LOOP
        IF rec.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'Y'
            WHERE CustomerID = rec.CustomerID;
        ELSE
            UPDATE Customers
            SET IsVIP = 'N'
            WHERE CustomerID = rec.CustomerID;
        END IF;
    END LOOP;
    
    COMMIT;
END;
/
