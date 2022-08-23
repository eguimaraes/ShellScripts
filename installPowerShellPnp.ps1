#https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2
winget install --id Microsoft.Powershell --source 
Install-Module -Name PnP.PowerShell
winget install --id=Microsoft.PowerShell -v "7.1.2" -e
choco install powershell -y
choco upgrade powershell -y
for PowerShell 7.x:
choco install pwsh -y
choco install pwsh -y
docker run -it m365pnp/powershell:1.10.0-nanoserver-1809
docker run -it m365pnp/powershell

