INSERT INTO Phones 
    (IMEI,FormerUser,NorR,Status,OEM,Model,AssetTag) 
    VALUES (
    '',			-- IMEI
    '',			            -- Former User
    'R',						-- NorR, N(ew) or R(epurposed)
    'In Stock',				    -- Status
    'Samsung',					-- OEM
    'A32',                      -- Model
    '' );

.mode box
SELECT IMEI, PhoneNumber, FormerUser, NorR, Status, AssetTag FROM Phones
WHERE LastUpdate > CURRENT_DATE
ORDER BY AssetTag DESC;
.exit 1