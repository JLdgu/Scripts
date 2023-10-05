UPDATE Phones SET PhoneNumber = NULL WHERE PhoneNumber = '';
UPDATE Phones SET SIMNumber = NULL WHERE SIMNumber = '';
UPDATE Phones SET FormerUser = NULL WHERE FormerUser = '';
UPDATE Phones SET SRNumber = NULL WHERE SRNumber = '';
UPDATE Phones SET AssetTag = NULL WHERE AssetTag = '';
UPDATE Phones SET NewUser = NULL WHERE NewUser = '';
UPDATE Phones SET Notes = NULL WHERE Notes = '';

SELECT * FROM Phones WHERE
PhoneNumber = '' OR
SIMNumber = '' OR
FormerUser = '' OR
SRNumber = ''  OR 
AssetTag = '' OR
Newuser = '' OR
Notes = '' ;
SELECT changes(), total_changes();
.exit 1