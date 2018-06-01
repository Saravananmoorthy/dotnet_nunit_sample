try{
Import-Module WebAdministration
$iisAppPoolName = "TestPool"
$SiteName = "TestSite"

#Creating App pool
if (!(Test-Path IIS:\AppPools\$iisAppPoolName )){
$appPool = New-WebAppPool -Name $iisAppPoolName -Force
Set-ItemProperty ("IIS:\AppPools\TestPool") -Name "managedRuntimeVersion" -Value "v4.0"
}
#Creating site
if(!(Test-Path "IIS:\Sites\TestSite")){
New-WebSite -Name $SiteName -PhysicalPath "D:\TrainTools\publishfolder1" -Force
$IISSite = "IIS:\Sites\TestSite"   
Set-ItemProperty $IISSite -name  Bindings -value @{protocol="http";bindingInformation="*:8087:"}
}
#Starting Default site
start-sleep -s 10
start-website "TestSite"
Write-Host "Successfully deployed Webservice"  -ForegroundColor Blue -BackgroundColor White
}
Catch {
Write-Host "Error: " + $_.Exception.Message;
exit 1
}