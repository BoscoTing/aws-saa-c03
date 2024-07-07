# userdata.ps1
# PowerShell
# If this script is not working check what version of PowerShell you have
# You can do this by: entering in the: $PSVersionTable variable.
# At the time of the script the Windows Server's on AWS was showing PowerShell 5.1 Desktop Edition
$PSVersionTable

# Define download URL for Apache HTTP Server (Update the URL to the latest version)
# https://www.apachelounge.com/download/
$downloadUrl = "https://www.apachelounge.com/download/VS17/binaries/httpd-2.4.61-240703-win64-VS17.zip"
# Define where to save the downloaded zip
$zipPath = "C:\apache.zip"

# Download Apache HTTP Server zip
# Since Invoke-WebRequest sometimes handles redirects poorly, use WebClient to download instead.
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($downloadUrl, $zipPath)

# Define the extraction path
$extractPath = "C:\Apache24"

# Extract the zip file
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

# Remove the downloaded zip file to save space
Remove-Item -Path $zipPath

# Apache HTTP Server configuration steps (if necessary)
# For example, editing httpd.conf to adjust server settings

# Path to the Apache Service Monitor executable
# $serviceMonitorPath = Join-Path -Path $extractPath -ChildPath "Apache24\bin\ApacheMonitor.exe"

# Install Apache as a Windows service (using the httpd.exe with the -k install option)
$httpdPath = Join-Path -Path $extractPath -ChildPath "Apache24\bin\httpd.exe"

if (Test-Path $httpdPath) {
    Start-Process -FilePath $httpdPath -ArgumentList '-k install' -Wait
} else {
    Write-Host "httpd.exe not found at path: $httpdPath"
}

# Configure Apache to start on port 8080
$configFilePath = Join-Path -Path $extractPath -ChildPath "Apache24\conf\httpd.conf"
(Get-Content $configFilePath) -replace 'Listen 80', 'Listen 8080' | Set-Content $configFilePath

# Start the Apache service
Start-Service -Name "Apache2.4"

# Optionally, use ApacheMonitor.exe to manage the Apache service
# Start-Process -FilePath $serviceMonitorPath