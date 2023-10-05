-- Remove a SIM from a Phone 
.param init
.param set $AssetTag MP00000

INSERT INTO SIMs (PhoneNumber, SIMNumber, Status) 
    SELECT PhoneNumber, SIMNumber, 'In Stock' FROM Phones WHERE AssetTag = $AssetTag;

UPDATE Phones
SET PhoneNumber = NULL,
    SIMNumber = NULL
WHERE AssetTag = $AssetTag;

SELECT changes(), total_changes();
.exit 1