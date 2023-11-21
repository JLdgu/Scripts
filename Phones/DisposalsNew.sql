INSERT INTO Disposals (
    SRNumber,
    IMEI, 
    FormerUser, 
    OEM, 
    Status, 
    AssetTag
)
VALUES (
    225316,
    '',  -- IMEI
    '',       -- Former User
    'Sony',             -- OEM
    'Decommissioned',
    ?);
.exit 1