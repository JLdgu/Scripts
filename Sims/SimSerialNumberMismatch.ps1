param (
    [string]$SqlScript,
    [string]$db ="live"
)
$script = Get-ScriptPath "Sims" "SimSerialNumberMismatch.sql"

switch ($db.ToLower()) {
    "live" { $dbPath = "p:/ICTS/Mobile Phones/PhoneAssistant/PhoneAssistant.db" }
    Default { $dbPath =  "c:/temp/paTest.db"  }
}

$env:Path += ';c:\temp\sqlite'
$restore = Get-Location
Set-Location "c:\temp"

If (Test-Path -Path "SimsMismatch.db") {
    Remove-Item "SimsMismatch.db"
    Write-Host "Deleted SimsMismatch.db"
}

sqlite3 $dbPath -init $script
Set-Location $restore