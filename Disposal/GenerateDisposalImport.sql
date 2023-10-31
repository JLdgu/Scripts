-- Import myScomis list into new database
.import --csv "SR204153 myScomis Phones.csv" phones

-- Import SCC list of disposed phones
-- delete first 3 rows before conversion to csv
.import --csv "SR204153 CR 149149 Units D1024CT 2023-10-30.csv" units

.mode csv
-- Phones which have not been set to decommissioned on myScomis
-- use file to create a Decommissioned import

.output "SR204153 Missed Decommissioned Import.csv"
--.output :missed
.print "Name,User,Status,Serial Number,Location,Owner,CI Notes,Service Request"
SELECT Name, '' as User, 
    'Decommissioned' as Status,
    '' as [Serial Number], 
    'L87 - End User Compute' as Location, 
    '' as Owner,'Decommissioned due to being out of support' as [CI Notes], 
    '204153' as [Service Request]
FROM phones as p
INNER JOIN units as u ON p.Name = u.[Serial Number]
WHERE p.[CI Status] <> 'Decommissioned';

-- All phones which have been disposed of by SCC
-- use file to create a Disposed import
.output "SR204153 Disposed Import.csv"
.print "Name,User,Status,Serial Number,Location,Owner,CI Notes,Service Request"
SELECT Name, '' as User, 
    'Disposed' as Status,
    '' as [Serial Number], 
    '' as Location, 
    '' as Owner,
    'SCC disposal Certificate ' || u.[Tracker Id] as [CI Notes],
    '204153' as [Service Request]
FROM phones as p
INNER JOIN units as u ON p.Name = u.[Serial Number];
.output 

.exit 1