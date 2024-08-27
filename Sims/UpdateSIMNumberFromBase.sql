UPDATE SIMs 
SET SIMNumber = b.SIMNumber
FROM SIMs AS s
INNER JOIN BaseReport AS b
ON s.PhoneNumber = b.PhoneNumber
WHERE s.SIMNumber <> b.SIMNumber;
