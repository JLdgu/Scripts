.mode box
.param init

.param set $AssetTag MP00
.param set $SR 22
.param set $User ""

SELECT IMEI, PhoneNumber, Status, SRNumber, NewUser, Notes, AssetTag
FROM Phones WHERE AssetTag = $AssetTag;

UPDATE Phones
SET Status = 'Production',
    SRNumber = $SR,
    NewUser = $User
WHERE AssetTag = $AssetTag;

SELECT IMEI, PhoneNumber, Status, SRNumber, NewUser, Notes, AssetTag
FROM Phones WHERE AssetTag = $AssetTag;
.exit 1