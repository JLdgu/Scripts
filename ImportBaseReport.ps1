$restore = $PSScriptRoot
If ($PWD.ToString() -ne $PSScriptRoot)
{
    $restore = $PWD
    Set-Location "C:\temp"
}
$script = "$PSScriptRoot\ImportBaseReport.sql"
$env:Path += ';c:\temp\sqlite'

sqlite3 "p:/ICTS/Mobile Phones/PhoneAssistant/PhoneAssistant.db" -init $script

Set-Location $restore