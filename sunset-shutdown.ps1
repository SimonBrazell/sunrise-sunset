$Latitude="YOUR_LATITUDE"
$Longitude="YOUR_LONGITUDE"

$Response = Invoke-RestMethod -Method Get -Uri "https://api.sunrise-sunset.org/json?lat=$Latitude&lng=$Longitude"

$Sunset = Get-Date $Response.results.sunset

$TaskName= "ShutdownTask"
$TaskPath= "\SunsetShutdown\"
$Trigger= New-ScheduledTaskTrigger -At $Sunset.ToLocalTime().ToString("HH:MM") -Once
$Action= New-ScheduledTaskAction -Execute "shutdown" -Argument "/S /F /T 600"
Try
{
  Unregister-ScheduledTask -TaskName $TaskName -TaskPath $TaskPath -Confirm:$false
}
Catch 
{}
Register-ScheduledTask -TaskName $TaskName -Trigger $Trigger -Action $Action -TaskPath $TaskPath
