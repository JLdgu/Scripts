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

SELECT changes(), total_changes();
.exit 1