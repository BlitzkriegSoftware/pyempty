<#
    Convert uv.lock to pip requirements.txt
    for compatibility, team rule is to rely on
    UV not pip...
#>

. $PSScriptRoot/Find-GitRepositoryRoot.ps1

$gitR = Find-GitRepositoryRoot -FilePath $PSScriptRoot;
if ( $null -eq $gitR) {
    Write-Output "Unable to find GIT Root"
    return 1;
}


if (Test-Path $gitR -PathType Container) {
    Push-Location $gitR
    .\.venv\Scripts\activate.ps1
    uv export --no-hashes --format requirements-txt > requirements.txt
    pip install -r requirements.txt
    Pop-Location
}