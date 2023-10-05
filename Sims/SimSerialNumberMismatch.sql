-- Create a table myScomisSIMs in SimsAwaitingReturn.db
-- containing all myScomis sim which are marked as In Stock
-- but are not in PhoneAssistant.db
.output paBase.sql
.dump BaseReport
.output
.open SimsMismatch.db
.read paBase.sql
CREATE TABLE myScomisSIMs
(
    PhoneNumber TEXT NOT NULL,
    SimNumber TEXT NULL
);
-- myScomisSIMs should contain 2 columns, PhoneNumber and SimNumber
.import --csv --skip 1 myScomisSims.csv myScomisSIMs  

-- Delete Sims that match with base report
DELETE FROM myScomisSIMs 
WHERE PhoneNumber IN (
	SELECT S.PhoneNumber
	FROM myScomisSIMs AS S
	INNER JOIN BaseReport AS B on S.PhoneNumber = B.[Telephone Number]
	WHERE S.SimNumber = B.[Sim Number]
	);

UPDATE myScomisSIMs 
SET SIMNumber = [Sim Number]
FROM (
	SELECT [Telephone Number], [Sim Number] FROM BaseReport) AS B
WHERE PhoneNumber = B.[Telephone Number];

.headers on
.mode csv
.output "SIM Mismatch with EE Base Report.csv"
SELECT PhoneNumber AS Name, SimNumber as [Serial Number] FROM myScomisSIMs;
.output

SELECT changes(), total_changes();
.exit 1