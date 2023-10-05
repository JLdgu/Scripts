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

SELECT changes(), total_changes();
.exit 1
