net stop WinCollect
cd \
cd  "Program Files"\IBM\WinCollect\config
del ConfigurationServer.old
ren ConfigurationServer.pem ConfigurationServer.old
:: in the below line, mentioned old and new target SIEM's ip addresses at mentioned places withouth '<' and '>' marks
powershell -Command "(gc 'C:\Program Files\IBM\WinCollect\config\install_config.txt') -replace '<old-target-siem-ip>', '<new-target-siem-ip>' | Out-File 'C:\Program Files\IBM\WinCollect\config\install_config.txt'"
::past the new SIEM's authentication token here (without '<' '>' marks)
start /d "C:\Program Files\IBM\WinCollect\bin" InstallHelper.exe -T <new-siem-authentication token here>
net start WinCollect
net stop WinCollect
net start WinCollect
pause