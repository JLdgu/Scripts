-- Remove all SIMs which do not exist in the BaseReport
DELETE FROM SIMs
WHERE PhoneNumber IN (
	SELECT s.PhoneNumber
	FROM SIMs as s
	LEFT JOIN BaseReport as b
	ON s.PhoneNumber = b.PhoneNumber
	WHERE b.PhoneNumber is null);