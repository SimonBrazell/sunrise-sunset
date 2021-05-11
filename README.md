# Sunset Shutdown

A script that schedules an OS (Windows) shutdown at sunset.

## Use Case

I made this to help limit the power consumption of my PC (mining rig), by restricting it's operation to between the hours of sunrise and sunset. This is when solar panels installed at it's location are generating an output and thus offsetting / providing green energy for the device.

## Prequisites:

- Windows PowerShell

## Start / Stop:

1. Open the `sunset-shutdown.ps1` file, and populate it with your latitude and longitude as follows:

   ```
   $latitude="YOUR_LATITUDE"
   $longitude="YOUR_LONGITUDE"
   ```

2. To start run `sunset-shutdown.ps1` with Powershell.
3. To stop open `Task Scheduler` and delete `\SunsetShutdown\ShutdownTask`.
