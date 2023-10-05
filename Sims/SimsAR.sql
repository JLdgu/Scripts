-- Create a table myScomisSIMs in SimsAwaitingReturn.db
-- containing all myScomis sim which are marked as In Stock
-- but are not in PhoneAssistant.db
.output SimsAR.sql
.dump Phones
.output
.open SimsAR.db
.read SIMsAR.sql
CREATE TABLE SimsAR
(
    "PhoneNumber" TEXT NULL,
    "SIMNumber" TEXT NULL
);
.import --csv --skip 1 SimsAR.csv SimsAR
--UPDATE myScomisSIMs
--SET Status = 'In Stock'
--WHERE PhoneNumber IN (
--	SELECT [Phone Number]
--	FROM SIMs);
--DELETE FROM myScomisSIMs
--WHERE Status = 'In Stock';
--DELETE FROM myScomisSIMs 
--WHERE PhoneNumber IN (
--	SELECT [Phone Number]
--	FROM SIMs);

SELECT changes(), total_changes();
.exit 1