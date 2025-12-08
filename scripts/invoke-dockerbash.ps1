<#
    bash into our running container
#>

[string]$IMAGENAME = "mainpydemo"
[string]$VOL = "/app/data"

docker exec -it --workdir "${VOL}"  "${IMAGENAME}" /bin/bash