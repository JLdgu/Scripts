UPDATE Phones
SET FormerUser=NewUser,
    [Status]='In Stock',
    SRNumber=?,
    Newuser=?,
    "Notes"=?
WHERE AssetTag = '';
SELECT changes(), total_changes();
.exit 1