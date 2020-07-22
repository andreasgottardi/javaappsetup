Set-Location "$PSScriptRoot"
Start-Process -FilePath 'java' -ArgumentList @('-cp', '..\lib\*', '-Dlogback.configurationFile=..\config\logback.xml', 'javalibexport.JavaLibExport') -NoNewWindow -Wait
Read-Host -Prompt 'Press enter to close the window'