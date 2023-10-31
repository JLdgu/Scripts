param (
    [string]$db ="live"
)

$script = "GenerateDisposalImport.sql"
$sr = "204153"
$missedImport = "SR$sr Missed Decommissioned Import.csv"
$disposedImport = "SR$sr Disposed Import.csv"

$db = "DisposalImport.db"
$env:Path += ';c:\temp\sqlite'

If (Test-Path -Path $db) {
    Remove-Item $db
    Write-Host "Deleted $db"
}
If (Test-Path -Path $missedImport) {
    Remove-Item $missedImport
    Write-Host "Deleted $missedImport"
}
If (Test-Path -Path $disposedImport) {
    Remove-Item $disposedImport
    Write-Host "Deleted $disposedImport"
}

sqlite3 $db -init $script
#sqlite3 $db ".param init" ".read $script"