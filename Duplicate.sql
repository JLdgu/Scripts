.mode box

SELECT 'Phones' , Count(*) FROM Phones;
SELECT 'Sims', Count(*) FROM SIMs;

SELECT IMEI, Phones.PhoneNumber, Phones.AssetTag 
FROM Phones
INNER JOIN SIMs on Phones.PhoneNumber = SIMs.PhoneNumber;

DELETE FROM SIMs
WHERE PhoneNumber IN (SELECT p.PhoneNumber
FROM Phones as p
INNER JOIN SIMs as s on p.PhoneNumber = s.PhoneNumber);

SELECT 'Phones' , Count(*) FROM Phones;
SELECT 'Sims', Count(*) FROM SIMs;

SELECT IMEI, Phones.PhoneNumber, Phones.AssetTag 
FROM Phones
INNER JOIN SIMs on Phones.PhoneNumber = SIMs.PhoneNumber;


.exit 1