Restart-Service LxssManager
net stop LxssManager
net start LxssManager
wsl.exe --shutdown
wsl.exe -t <DistroName>
 
