INSERT INTO SIMs 
(PhoneNumber, SIMNumber, Status, Notes) 
VALUES (
'',  
'',
'In Stock',
?
);

.mode box
SELECT PhoneNumber, SimNumber, Status FROM SIMs
WHERE LastUpdate > CURRENT_DATE;
.exit 1