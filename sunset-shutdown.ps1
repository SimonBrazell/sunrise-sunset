$latitude="YOUR_LATITUDE"
$longitude="YOUR_LONGITUDE"

$response = Invoke-RestMethod -Method Get -Uri "https://api.sunrise-sunset.org/json?lat=$latitude&lng=$longitude&date=today"

$sunset = Get-Date $Response.results.sunset

$taskname = "ShutdownTask"
$taskpath = "\SunsetShutdown\"
$trigger = New-ScheduledTaskTrigger -At $sunset.ToLocalTime().ToString("HH:m:s") -Once
$action = New-ScheduledTaskAction -Execute "shutdown" -Argument "/S /F /T 600"
Try {
  Unregister-ScheduledTask -TaskName $taskname -TaskPath $taskpath -Confirm:$false
}
Catch{}

Register-ScheduledTask -TaskName $taskname -Trigger $trigger -Action $action -TaskPath $taskpath

Write-Host
Write-Host "Shutdown scheduled for -" $sunset.ToLocalTime().ToString("HH:m:s")