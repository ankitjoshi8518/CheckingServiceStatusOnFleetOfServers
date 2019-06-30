$serverlist=Get-Content -Path C:\Users\username\Desktop\server-list.csv   #contains the list of servers in the following Format -->  server1,server2,server3
$servicename="ntds"   # name of the service that needs to be checked
$servers=$serverlist.Split(',')
$noofservers=$servers.length #identifying the number of servers to  run the loop accordingly
$count=0

while ($count -lt $noofservers) 

{
    "Currently checking" 
    $servers[$count]
    Add-Content -Path $status -Value $servers[$count] 
    Get-Service -Name $servicename -ComputerName $servers[$count] | Format-List status  # get only the status of the service on the server
    $count=$count+1
}
