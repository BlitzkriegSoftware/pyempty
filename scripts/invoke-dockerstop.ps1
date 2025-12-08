<#
    Stop and dismantle running docker image
#>

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

[string]$IMAGENAME = "mainpydemo"

# Dispose of any old running containers
$null = (docker stop "${IMAGENAME}") 2> $null
$null = (docker rm "${IMAGENAME}") 2> $null
