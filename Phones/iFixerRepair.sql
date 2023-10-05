.mode box
.param init

.param set $IMEI "351554746943928"

SELECT IMEI, PhoneNumber, Status, SRnumber, NewUser, Notes, AssetTag
FROM Phones WHERE IMEI = $IMEI;

UPDATE Phones SET 
    Status='In Stock',
    Notes='ifixer repair',
    AssetTag = 'MP00417'
WHERE IMEI = $IMEI;

SELECT IMEI, PhoneNumber, Status, SRnumber, NewUser, Notes, AssetTag
FROM Phones WHERE IMEI = $IMEI;

SELECT changes(), total_changes();
.exit 1