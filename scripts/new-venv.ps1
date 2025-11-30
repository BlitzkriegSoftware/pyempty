<#
    Create a new venv and activate it
    if exists, force creation of a new clean one
#>

. $PSScriptRoot/Find-GitRepositoryRoot.ps1

$gitR = Find-GitRepositoryRoot -FilePath $PSScriptRoot;

if ($null -ne $gitR) {

    $venvR = Join-Path -Path $gitR -ChildPath 'venv' 
    if (Test-Path -Path $venvR -PathType Container) {
        Remove-Item -Path $venvR -Recurse -Force
    }

    Push-Location $gitR
    python -m venv venv
    .\venv\Scripts\Activate.ps1
    Pop-Location
}