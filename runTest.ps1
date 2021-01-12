## Variables might need to be updated accordingly
$targetSpecs = "specs"

## Variables fixed, do not change it.
$workingPath = $Env:BUILD_SOURCESDIRECTORY
$gaugeExe = "gauge.cmd"

Write-Output "======Gauge Version Info====="
Invoke-Expression "$gaugeExe version"

Write-Output "======Dotnet Info====="
Invoke-Expression "dotnet --info"

Write-Output "======Start Run Gauge Test for $targetProject ======="
Set-Location "$workingPath"
Invoke-Expression "$gaugeExe run $targetSpecs"

Write-Output "======Copy Test Logs and Result for $targetProject ======="
$sourceReport = "$(Get-Location)\reports"
$sourceLog = "$(Get-Location)\logs"
Copy-Item -Path $sourceReport -Recurse -Destination "$workingPath\artifacts" -container
Copy-Item -Path $sourceLog -Recurse -Destination "$workingPath\artifacts" -container 