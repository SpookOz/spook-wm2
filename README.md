### Currently in testing phase.

This script is an attempt to work around the WinMax 2024 issue on BIOS 0.40 whereby the device will wake from sleep after 5% battery drain.
The script attempts to do the following:

1. Checks if the screen is open. If so, it assumes the device should be awake and exits without doing anything.
2. Checks to see if the system is still waking and waits to make sure the wake cycle is finished.
3. Checks what the current wake status is. If it is "post suspend" it will put it back to sleep. If it is "pre suspend", it will terminate the sleep cycle and then start it again and put it to sleep.

### INSTRUCTIONS

1. Place this script in /lib/systemd/system-sleep/wakeup-script.sh
2. Make the script executable: sudo chmod +x /lib/systemd/system-sleep/wakeup-script.sh

NB: The script will log its actions to the system journal with the tag: SleepPatch. To check, run the command: sudo journalctl -b | grep "SleepPatch"
NB: If you try to wake your device while the lid is closed (eg with external screen attached) this script will put it back to sleep immediately. So if you work with your screen closed, this script is probably not for you.
