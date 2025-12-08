<#
    Do a docker build
#>

param (
    [Parameter()]
    [bool]$DoRun = $false
)

$IMAGENAME = "mainpydemo"
$TAGNAME = "main-py-demo"

. $PSScriptRoot/Find-GitRepositoryRoot.ps1

$gitR = Find-GitRepositoryRoot -FilePath $PSScriptRoot;

if (Test-Path $gitR -PathType Container) {
    Push-Location $gitR
    docker build --progress=plain -t $IMAGENAME . --tag $TAGNAME

    if ($DoRun) {
        docker run $IMAGENAME
    }

    Pop-Location
}