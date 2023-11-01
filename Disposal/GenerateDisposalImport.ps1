$restore = $PSScriptRoot
If ($PWD.ToString() -ne $PSScriptRoot)
{
    $restore = $PWD
    Set-Location $PSScriptRoot
#    Write-Output "Script must be executed from CLI"
#    Exit
}

$script = "$PSScriptRoot\GenerateDisposalImport.sql"
$sr = "204153"
$missedImport = "$PSScriptRoot\SR$sr Missed Decommissioned Phones Import.csv"
$disposedImport = "$PSScriptRoot\SR$sr Disposed Phones Import.csv"

$db = "$PSScriptRoot\DisposalImport.db"
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

# Rember to change SR number in script
sqlite3 $db -init $script

# Change output csv to xlsx and save IMEI columns as number with zero dp
# Relies on Install-Module -Name ImportExcel -RequiredVersion 5.4.2 -Scope CurrentUser
function Convert-CSV {
    param (
        [string]$csvFile
    )
    $xlsxFile = $csvFile.Replace("csv", "xlsx")
    $xl = Import-CSV $csvFile | Export-Excel $xlsxFile -PassThru
    $xs = $xl.Workbook.Worksheets["Sheet1"]
    Set-Format -WorkSheet $xs -Range "a:a" -NumberFormat "0" -AutoSize
    Export-Excel -ExcelPackage $xl -WorkSheetname "Sheet1"
    }

Convert-CSV $missedImport
Convert-CSV $disposedImport
Set-Location $restore

Remove-Item $db
Remove-Item $missedImport
Remove-Item $disposedImport
