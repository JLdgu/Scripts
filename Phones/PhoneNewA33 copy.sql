INSERT INTO Phones 
    (IMEI,FormerUser,NorR,Status,OEM,Model,AssetTag) 
    VALUES (
    '',			-- IMEI
    ?,			            -- Former User
    'N',						-- NorR, N(ew) or R(epurposed)
    'In Stock',				    -- Status
    'Samsung',					-- OEM
    'A33',                      -- Model
    '' );

SELECT changes(), total_changes();
.exit 1