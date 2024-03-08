INSERT INTO Phones 
    (IMEI,PhoneNumber,SIMNumber,FormerUser,NorR,Status,OEM,Model,AssetTag,Notes) 
    VALUES (
    '',			-- IMEI
    '', 		-- Phone Number, '122345' or NULL 
    '', 		-- SIM Number, '123456' or NULL 
    '',   	    -- Former User
    'R',						-- NorR, N(ew) or R(epurposed)
    'In Stock',				    -- Status
    'Samsung',					-- OEM
    'A32',                      -- Model
    '',					-- Asset Tag
    NULL);

.mode box
SELECT IMEI, PhoneNumber, FormerUser, NorR, Status, AssetTag FROM Phones
WHERE LastUpdate > CURRENT_DATE
ORDER BY AssetTag DESC LIMIT 2;
.exit 1