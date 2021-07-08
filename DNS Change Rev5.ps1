<#
This scipt's purpose is to change DNS servers for devices, it validates the current set DNS, sets the specified DNS, and then verifies it after by checking what the DNS servers are set to, and check against the loopbacked domain on their network.

Made by Edwin Brett, Please reach out via https://Edwinbrett.com if you have any issues.
#>

Write-Host "  DNS Change
=======================" -ForegroundColor Yellow

# Show DNS servers before update
Write-Host "Before: " -ForegroundColor Green
Get-NetIPConfiguration -InterfaceAlias Ethernet



#Actual Change of the DNS servers
""
Write-Host "Changing DNS" -ForegroundColor Magenta

""

$Adapters = Get-NetAdapter -Name "Ethernet"
$Adapters | Set-DnsClientServerAddress -ServerAddresses "1.1.1.1"

#Wait time for DNS Change
Start-Sleep -Seconds 2.5

# Show DNS servers after update
Write-Host "After: " -ForegroundColor Green
Get-NetIPConfiguration -InterfaceAlias Ethernet

""

#Verification of DNS change
Write-Host "Bing.com should resolve to 127.0.0.1
Edwinbrett.com should resolve to xxx.xxx.xxx..xxx" -ForegroundColor Yellow
Resolve-DnsName -Name www.bing.com
""
Resolve-DnsName -Name www.edwinbrett.com

Pause