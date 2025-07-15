$env:Path += ';c:\dev\sqlite'

sqlite3 "c:/dev/paTest.db" ".output c:\temp\locations.sql" ".dump" ".exit"