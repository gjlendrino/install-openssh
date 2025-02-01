# iex (irm "https://raw.githubusercontent.com/tu_usuario/tu_repositorio/main/install-openssh.ps1")
# iex (irm "http://embajadores300.duckdns.org:8080/install-openssh.ps1")
# iex (irm "http://192.168.1.126/install-openssh.ps1")
# Invoke-RestMethod -Uri "http://192.168.1.126/install-openssh.ps1" | PowerShell -Command -

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
$installerUrl = "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v9.8.1.0p1-Preview/OpenSSH-Win64-v9.8.1.0.msi"
$installerPath = "$env:TEMP\OpenSSH-Win64.msi"

Start-Process iexplore.exe -Wait

Write-Host "Downloading OpenSSH installer..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

Write-Host "Installing OpenSSH..."
Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" /qn /norestart" -Wait -NoNewWindow

Set-Service -Name sshd -StartupType Automatic
Start-Service -Name sshd

Write-Host "OpenSSH installation completed."
