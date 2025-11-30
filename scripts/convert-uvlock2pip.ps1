<#
    Convert uv.lock to pip requirements.txt
    for compatibility, team rule is to rely on
    UV not pip...
#>

. $PSScriptRoot/Find-GitRepositoryRoot.ps1

$gitR = Find-GitRepositoryRoot -FilePath $PSScriptRoot;

if (Test-Path $gitR -PathType Container) {
    Push-Location $gitR
    uv export --no-hashes --format requirements-txt > requirements.txt
    Pop-Location
}