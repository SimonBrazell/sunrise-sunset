# Sunrise Startup / Sunset Shutdown

Scripts that schedule a boot or an OS (Windows) shutdown at sunrise and sunset.

## Use Case

I made these to help limit the power consumption of my PC (mining rig), by restricting it's operation to between the hours of sunrise and sunset. This is when solar panels installed at it's location are generating an output and thus offsetting / providing green energy for the device.

## Sunrise Startup

### Prequisites:

- Netowrk device running OpenWrt
- `date` (GNU coreutils 8.32)
- `curl`
- `jq`
- `wakeonlan`
- Enable Wake on LAN on the target device.

### Start / Stop:

1. Open the `sunrise-startup.sh` file, and populate it with your details as follows:

   ```
   LATITUDE="YOUR_LATITUDE"
   LONGITUDE="YOUR_LONGITUDE"
   MAC_ADDRESS="YOUR_MAC_ADDRESS"
   BROADCAST_ADDRESS="YOUR_BROADCAST_ADDRESS"
   ```

2. `mv sunrise-startup.sh /usr/local/bin/sunrise-startup` on the OpenWrt device.
3. Make the script executable `chmod +x /usr/local/bin/sunrise-startup`
4. Run `/usr/local/bin/sunrise-startup`
5. Run `crontab -l` to see the scheduled task.
6. To stop, remove the task.

## Sunset Shutdown

### Prequisites:

- Windows PowerShell

### Start / Stop:

1. Open the `sunset-shutdown.ps1` file, and populate it with your latitude and longitude as follows:

   ```
   $latitude="YOUR_LATITUDE"
   $longitude="YOUR_LONGITUDE"
   ```

2. To start run `sunset-shutdown.ps1` with Powershell.
3. To stop open `Task Scheduler` and delete `\SunsetShutdown\ShutdownTask`.
