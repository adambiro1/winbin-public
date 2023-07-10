#remote to pc in AD using WMI
$CimSession = New-CimSession -ComputerName dc01 -Credential (Get-Credential)

 
#the best option for this funtcion is to have it in Powershell Profile
function remote-pc {param($pcname) $CimSession = New-CimSession -ComputerName $pcname -Credential (Get-Credential)}

 