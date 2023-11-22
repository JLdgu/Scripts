.mode box

SELECT IMEI, Phones.AssetTag 
FROM Phones
INNER JOIN SIMs on Phones.PhoneNumber = SIMs.PhoneNumber;

.exit 1