param (
    [string]$SqlScript
)
switch ($SqlScript.ToLower()) {
    "ifr" {$script = Get-ScriptPath "Phones" "ifixerRepair.sql"; break }
    "e2n" {$script = Get-ScriptPath "Phones" "PhoneEmptyToNull.sql"; break }
    "nns" {$script = Get-ScriptPath "Phones" "PhoneNewNoSIM.sql"; break }
    "nws" {$script = Get-ScriptPath "Phones" "PhoneNewWithSIM.sql"; break }
    "rs" {$script = Get-ScriptPath "Phones" "PhoneRemoveSIM.sql"; break }
    "uws" {$script = Get-ScriptPath "Phones" "PhoneUpdateWithSR.sql"; break }
    "smtp" {$script = Get-ScriptPath "Sims" "SimMovetoPhone.sql"; break }
    "sn" {$script = Get-ScriptPath "Sims" "SimNew.sql"; break }
    
Default {
        Write-Host "Script choice not found - valid scripts are" -ForegroundColor Red;     
        Write-Host "ifr - ifixerRepair"
        Write-Host "e2n - PhoneEmptyToNull"
        Write-Host "nns - PhoneNewNoSIM"
        Write-Host "nws - PhoneNewWithSIM"
        Write-Host "rs - PhoneRemoveSIM"
        Write-Host "uws - PhoneUpdateWithSR"
        Write-Host "smtp - SimMovetoPhone"
        Write-Host "sn - SimNew"
        return}
}
$dbPath =  "c:/temp/paTest.db" 

$env:Path += ';c:\temp\sqlite'
Write-Host "Database $dbPath"
sqlite3 $dbPath -init $script