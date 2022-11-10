# Smiley Man Job Queue
Shell script GUI wrapper for your Printer needs!
Usually a Printer Job Queue is not Very Accessible on Most Linux Oses and Cannot be
Pinned to the Desktop. I usually had Trouble Finding it!!
So here,goes. A Zenity Wrapped Shell Script for the Most basic and somewhat Useful Tasks.

You can add a Shortcut directly to the Queue to the Menu, Taskbar.

This is basically a Job Queue.

It also has a Nifty feature to find out your Printers IPP or DDNSD address URI.
This comes in Handy in Linux, while Installing Printers, they ask for this.

Many times I had no Clue what my Printer's IP Address Is!
Again I have to Fetch it using some other commands or the Router's Interface.
Then I am not quite sure of the Printer's IPP/DDNSD URI

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

Make Sure Your Printer is Connected to Network before Opening Printer URI Page.


 
<a href="https://www.flaticon.com/free-icons/print" title="print icons">Print icons created by Freepik - Flaticon</a>
