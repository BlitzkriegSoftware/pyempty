<#
    Create a new venv and activate it
    if exists, force creation of a new clean one
#>

[string]$venv_dir = '.venv'

. $PSScriptRoot/Find-GitRepositoryRoot.ps1

$gitR = Find-GitRepositoryRoot -FilePath $PSScriptRoot;

if ($null -ne $gitR) {

    $venvR = Join-Path -Path $gitR -ChildPath  $venv_dir
    if (Test-Path -Path $venvR -PathType Container) {
        Remove-Item -Path $venvR -Recurse -Force
    }

    Push-Location $gitR
    python -m venv $venv_dir
    . ".\${venv_dir}\Scripts\Activate.ps1"
    Pop-Location
}