.mode box
.param init

.param set $IMEI ""

SELECT IMEI, PhoneNumber, Status, SRnumber, NewUser, Notes, AssetTag
FROM Phones WHERE IMEI = $IMEI;

UPDATE Phones SET 
    Status='In Stock',
    Notes='ifixer repair',
    AssetTag = ''
WHERE IMEI = $IMEI;

SELECT IMEI, PhoneNumber, Status, SRnumber, NewUser, Notes, AssetTag
FROM Phones WHERE IMEI = $IMEI;

SELECT changes(), total_changes();
.exit 1