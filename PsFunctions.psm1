# Copy this files to one of $env:PSModulePath  + /PsFunctions
# then Import-Module PsFunction
function Get-ScriptPath {
    param (
        [string]$ScriptFolder,
        [string]$SqlScript
    )
    $restore = Get-Location 
    if ($restore.ToString().ToLower().EndsWith($ScriptFolder.ToLower())) {
        $ScriptPath = Join-Path $restore $SqlScript
    }
    else {
        $ScriptPath = Join-Path $restore $ScriptFolder
        $ScriptPath = Join-Path $ScriptPath $SqlScript
    }
    $ScriptPath
}