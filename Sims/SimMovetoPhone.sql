.mode box
.param init

.param set $AssetTag ""
.param set $Phone "''"

UPDATE Phones
SET PhoneNumber = sim.PhoneNumber,
    SIMNumber = sim.SIMNumber
FROM (SELECT sims.PhoneNumber, sims.SIMNumber FROM SIMs WHERE SIMs.PhoneNumber = $Phone) AS sim
WHERE Phones.AssetTag = $AssetTag;

SELECT IMEI, PhoneNumber, Status, SRNumber, NewUser, Notes, AssetTag
FROM Phones WHERE AssetTag = $AssetTag;
 
DELETE FROM SIMs
WHERE SIMS.PhoneNumber = $Phone;

SELECT changes(), total_changes();
.exit 1

