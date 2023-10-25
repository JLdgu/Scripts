.mode box
.param init

.param set $AssetTag MP00

SELECT IMEI, PhoneNumber, FormerUser, Status, SRNumber, NewUser, Notes, AssetTag
FROM Phones WHERE AssetTag = $AssetTag;

UPDATE Phones
SET FormerUser=NewUser,
    [Status]='In Stock',
    SRNumber=?,
    Newuser=?,
    "Notes"=?
WHERE AssetTag = $AssetTag;

SELECT IMEI, PhoneNumber, FormerUser, Status, SRNumber, NewUser, Notes, AssetTag
FROM Phones WHERE AssetTag = $AssetTag;

SELECT changes(), total_changes();
.exit 1