.mode box
.param init

.param set $Phone "''"

SELECT PhoneNumber, SIMNumber, UserName
FROM BaseReport
WHERE PhoneNumber = $Phone;
 
INSERT INTO SIMs (PhoneNumber, SIMNumber, Status, Notes)
    SELECT PhoneNumber, SIMNumber, 'In Stock', UserName
    FROM BaseReport
    WHERE PhoneNumber = $Phone;

SELECT PhoneNumber, SIMNumber, Status, Notes
FROM SIMS 
WHERE SIMS.PhoneNumber = $Phone;

SELECT changes(), total_changes();
.exit 1

