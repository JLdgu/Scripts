param (
    [string]$SqlScript
)
switch ($SqlScript.ToLower()) {
    "pdn" {$script = Get-ScriptPath "Phones" "DisposalsNew.sql"; break }
    "pe2n" {$script = Get-ScriptPath "Phones" "PhoneEmptyToNull.sql"; break }
    "pifr" {$script = Get-ScriptPath "Phones" "ifixerRepair.sql"; break }
    "pis" {$script = Get-ScriptPath "Phones" "PhoneInStock.sql"; break }
    "pnns" {$script = Get-ScriptPath "Phones" "PhoneNewNoSIM.sql"; break }
    "pnws" {$script = Get-ScriptPath "Phones" "PhoneNewWithSIM.sql"; break }
    "prs" {$script = Get-ScriptPath "Phones" "PhoneRemoveSIM.sql"; break }
    "puws" {$script = Get-ScriptPath "Phones" "PhoneUpdateWithSR.sql"; break }
    "smtp" {$script = Get-ScriptPath "Sims" "SimMovetoPhone.sql"; break }
    "sn" {$script = Get-ScriptPath "Sims" "SimNew.sql"; break }
    
Default {
        Write-Host "Script choice not found - valid scripts are" -ForegroundColor Red;     
        Write-Host "pe2n - PhoneEmptyToNull"
        Write-Host "pifr - ifixerRepair"
        Write-Host "pis - PhoneInStock"
        Write-Host "pnns - PhoneNewNoSIM"
        Write-Host "pnws - PhoneNewWithSIM"
        Write-Host "prs - PhoneRemoveSIM"
        Write-Host "puws - PhoneUpdateWithSR"
        Write-Host "smtp - SimMovetoPhone"
        Write-Host "sn - SimNew"
        return}
}
$dbPath = "K:/FITProject/ICTS/Mobile Phones/PhoneAssistant/PhoneAssistant.db"

$env:Path += ';c:\temp\sqlite'
Write-Host "Database $dbPath"
sqlite3 $dbPath -init $script