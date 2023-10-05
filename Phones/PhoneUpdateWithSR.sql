.mode box
.param init

.param set $AssetTag MP00105
.param set $SR 9999
.param set $User "Abbey Turner"

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