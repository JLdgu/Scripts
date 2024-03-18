INSERT INTO Phones (
    SRNumber,
    IMEI, 
    FormerUser, 
    OEM, 
    Model,
    Status, 
    AssetTag,
    NorR
)
VALUES (
    225316,
    '',  -- IMEI
    ?,                  -- Former User
    '',            -- OEM
    '',
    'Decommissioned',
    ?,                  -- AssetTag
    'R');

.mode box
SELECT IMEI, PhoneNumber, FormerUser, NorR, Status, AssetTag FROM Phones
WHERE LastUpdate > CURRENT_DATE
ORDER BY LastUpdate DESC LIMIT 2;
.exit 1