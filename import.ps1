$env:Path += ';c:\dev\sqlite'

sqlite3 "c:\temp\ciList.db" '.import --csv "c:/temp/CI List.csv" CIs'

