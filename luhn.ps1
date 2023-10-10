param (
    [string]$luhn
)

$env:Path += ';C:\dev\Luhn\bin\Release\net7.0'
luhn.exe $luhn
Write-Host ""