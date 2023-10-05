-- Move a Phone to Disposals
-- Ensure you update BOTH Phone Numbers and the Asset Tag

-- User New User version unless NULL
--INSERT INTO Disposals (IMEI, "New User", "OEM", Status, "SR Number", AssetTag) 
--    SELECT "IMEI", "New User", OEM, "Decommissioned", 210812, "Asset Tag" FROM Phones WHERE Phones."Asset Tag" = 'MP00281';

-- Instead use Former User version
INSERT INTO Disposals (IMEI, "Former User", OEM, Status, "SR Number", AssetTag) 
    SELECT "IMEI", "Former User", OEM, "Decommissioned", 210812, "Asset Tag" FROM Phones WHERE Phones."Asset Tag" = 'MP00281';

DELETE FROM Phones
    WHERE "Asset Tag" = 'MP00281';