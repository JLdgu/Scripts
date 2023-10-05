-- Create a table myScomisSIMs in SimsAwaitingReturn.db
-- containing all myScomis sim which are marked as In Stock
-- but are not in PhoneAssistant.db
.output paSIMs.sql
.dump SIMs
.output
.open SimsAwaitingReturn.db
CREATE TABLE myScomisSIMs
(
    "PhoneNumber" TEXT NULL,
    "SIMNumber" TEXT NULL, 
    Status TEXT
);
.mode csv
.import "C:\\Users\\Jonathan.Linstead\\OneDrive - Devon County Council\\Phones\\SIMs Instock myScomis.csv" myScomisSIMs
.read paSIMs.sql
--UPDATE myScomisSIMs
--SET Status = 'In Stock'
--WHERE PhoneNumber IN (
--	SELECT PhoneNumber
--	FROM SIMs);
--DELETE FROM myScomisSIMs
--WHERE Status = 'In Stock';
DELETE FROM myScomisSIMs 
WHERE PhoneNumber IN (
	SELECT PhoneNumber
	FROM SIMs);

SELECT changes(), total_changes();
.exit 1