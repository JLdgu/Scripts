param(
    [string]$name = "Linstead"
    )
$filter = 'Name -like "*' + $name + '*"'
Get-ADUser -filter $filter -Properties LastLogonDate, EmailAddress, whenCreated, PasswordLastSet, Enabled `
    | Sort-Object Name `
    | Format-Table Name, LastLogonDate, EmailAddress, whenCreated, PasswordLastSet, Enabled -A

# All properties for filtered user
#Get-ADUser -filter $filter -Properties * #| Format-Table * -A