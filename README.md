
# The Great Smiley Man Job Queue


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
 
```Exec=/home/[your_home_directory]/shell-script/Printer_Troubleshooter.sh```

```Icon=/home/[your_home_directory]/shell-script/printer.png```
<hr>

### Troubleshooting Tips for Linux Printers
I would recommend you uninstall ALL your "printer drivers" (if you really want to solve your problem
quickly and easily, without much head crunching and technical suave) such as hplip and hp-setup-app
and any other apps depending on your printer make. 

Also try and Make sure all these apps which you may have installed through the different package managers
(and some which have come pre-installed)such as apt, and snap are ALL removed thru these respective sources.
Also there is a better way of connecting the printer directly using ipp ddnsd or other protocols which are
supported by almost all printers.


This can make you achieve very basic printing VERY QUICKLY.

The problems I face are usually related to Printer IP Address. My printer is not  on all the time. I only 
switch it on during Printing.


Unless your printer has advanced or Extra Features, then Only Then! you may install their drivers.

_Make Sure Your Printer is Connected to Network before Opening Printer URI Page._

Linux Operating Systems have a manual (And sure shot way Make-do way of getting Printers Ready)
Just Type in the Printer IPP address which this App searches for you.


 
<a href="https://www.flaticon.com/free-icons/print" title="print icons">Print icons created by Freepik - Flaticon</a>
