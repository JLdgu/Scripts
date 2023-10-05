INSERT INTO Phones 
    (IMEI,FormerUser,NorR,Status,OEM,Model,AssetTag) 
    VALUES (
    '',			-- IMEI
    '',			            -- Former User
    '',						-- NorR, N(ew) or R(epurposed)
    'R',				    -- Status
    'Samsung',					-- OEM
    'A32',                      -- Model
    null);

SELECT changes(), total_changes();
.exit 1