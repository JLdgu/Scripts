DELETE FROM BaseReport;
.import --csv --skip 1 "c:/temp/Devon Base Report 091123.csv" BaseReport
SELECT COUNT(*) FROM BaseReport;
.exit 1