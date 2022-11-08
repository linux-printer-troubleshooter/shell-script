# Linux-Printers-Job-Shell-GUI-Script
Shell script to manage Linux printing Jobs and 
a Queue Manager GUI and Printer URI finder 
using a Shell Script with added GUI, Troubleshoot Job Queues and Printers

Please customize this script according to your needs!!

## Installation
```$ git clone  https://github.com/linux-printer-troubleshooter/shell-script.git   ```

```$ cd shell-script ```

```$ chmod +x Printer_Troubleshooter.sh ```

### Dependencies
```sudo apt install zenity```


 <a href="https://form.jotform.com/223103545577455"> Feedback Form </a>

 Please manually replace the home directory in Job Queue.desktop file
 
 ```sudo cp Job\ Queue.desktop /usr/share/applications ```
 
 ```sudo nano ./Job\ Queue.desktop```
 
Exec=/home/[your_home_directory]/shell-script/Printer_Troubleshooter.sh

Icon=/home/[your_home_directory]/shell-script/printer.png

### Troubleshooting Tips for Linux Printers
Please uninstall ALL your printer drivers such as hplip and hp-setup-app
and any other apps depending on your printer make. Make sure all these apps
which you may have installed through the different package managers such 
as apt, and snap, Also there is a better way of connecting the printer directly
using ipp ddnsd or other protocols which are supported by almost all printers.
This can make you achieve a very basic printing  Unless your printer has 
advanced or Extra Features, then (Only Then! you may install their drivers.
 
<a href="https://www.flaticon.com/free-icons/print" title="print icons">Print icons created by Freepik - Flaticon</a>
