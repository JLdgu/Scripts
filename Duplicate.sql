.mode box

SELECT IMEI, Phones.[Asset Tag] 
FROM Phones
INNER JOIN SIMs on Phones.[Phone Number] = SIMs.[Phone Number];

.exit 1