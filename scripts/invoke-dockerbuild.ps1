<#
    Do a docker build
#>

param (
    [Parameter()]
    [bool]$DoRun = $false
)


function Get-DockerRunning {

    [bool]$DockerAlive = $false

    try {
        $null = Get-Process 'com.docker.backend' -ErrorAction Stop
        $DockerAlive = $true;
    }
    catch {
        $DockerAlive = $false;
    }

    return $DockerAlive
}

Set-StrictMode -Version 2.0
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls -bor [Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls12

[bool]$da = Get-DockerRunning
if (! $da) {
    Write-Error "docker must be running 1st"
    return 1
}


[string]$TAGNAME = "main-py-demo"
[string]$IMAGENAME = "mainpydemo"
[string]$VOL = "/app/data"
[Int32]$PORT = 8080

. $PSScriptRoot/Find-GitRepositoryRoot.ps1

$gitR = Find-GitRepositoryRoot -FilePath $PSScriptRoot;

if (Test-Path $gitR -PathType Container) {
    Push-Location $gitR
    docker build --progress=plain -t $IMAGENAME . --tag $TAGNAME

    [string]$dbPath = Join-Path -Path $gitR -ChildPath "data"

    if ($DoRun) {
        # Dispose of any old running containers
        $null = (docker stop "${IMAGENAME}") 2> $null
        $null = (docker rm "${IMAGENAME}") 2> $null

        docker run -d `
            -e "PORT=${PORT}"  `
            -v "${dbPath}:${VOL}" `
            --name $IMAGENAME `
            $IMAGENAME
    }

    Pop-Location
}