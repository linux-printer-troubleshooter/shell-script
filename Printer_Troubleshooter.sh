#!/bin/bash


remove_printer () {
 echo Listing Printers..........;ass=$( lpstat -e |  zenity --list --column="Job ID" --column="User" --column="Queue" --column=File  --width=400 --height=700 --text="Printers" --title="$stats" --extra-button="URI"  --ok-label="Done" --extra-button="About me"  2>/dev/null );page=$(echo $ass | awk '{print $1}');echo $ass;if [[ $page == 'URI' ]]; then if zenity --question --text="Open URI?"; then troubleshoot_device ;fi;fi;if [[ $page == 'About' ]]; then about;else lpadmin -x $ass;fi;
}

about ()
{
zenity --forms --text='<a href="https://github.com/linux-printer-troubleshooter/shell-script">Github repository\n\n</a> Known Issue#1 Process does not kill on Pressing OK, Known Missing Feature#1 Printer list does not update by itself\n\n\n\n\n\n\n\n\nblue clipart PNG Designed By Molly from<a href="https://pngtree.com/freepng/a-few-blue-clouds-and-rain_5624369.html?sol=downref%26id=bef"> pngtree</a>'
}


restart_hold () { echo Starting Printer Job Queue..;stats=$1;no=$( lpq -a | wc -l );no=$(( no-1 ));ass=$( lpq -a | tail -n$no | awk -F " " '{ print $3"\n"$2"\n"$1"\n"$4}' |  zenity --list --column="Job ID" --column="User" --column="Queue" --column=File  --width=300 --height=400 --text="Press OK to $stats" --title="$stats"   2>/dev/null );page=$(echo $ass | awk '{print $1}');echo $ass;if [[ $page == '' ]];then page='x';echo nothing ;else echo echoing lp -i $ass -H $stats;lp -i $ass -H $stats;fi;};

open_queue () { skip=1;echo Starting Printer Job Queue..;page='';while [[ $page == '' ]]; do var="hello bye Click Here";no=$( lpq -a | wc -l );no=$(( no-1 ));ass=$( lpq -a | tail -n$no | awk -F " " '{ print $3"\n"$2"\n"$1"\n"$4}' |  zenity --list --column="Job ID" --column="User" --column="Queue" --column=File  --width=400 --height=400 --text='<b>select Job id</b> to <b>KILL</b>\t<span foreground="grey" font="10">Please Cancel the Job from Printer if it is already initiated</span>\n<i>Cancel Refreshes Queue</i>\n' --title="Printer Job Queue" --extra-button="Exit" --extra-button="Hold" --extra-button="Release" --extra-button="Restart" --extra-button="Remove Printer" 2>/dev/null );page=$(echo $ass | awk '{print $1}');echo $ass;if [[ $page == '' ]] ;then echo do nothing;skip=0;fi;if [[ $page == 'Exit' ]]; then  page='x';skip=0;fi;if [[ $page == 'Hold' ]];then restart_hold "hold"   ;skip=0;page='';fi;if [[ $page == 'Release' ]];then restart_hold "resume";skip=0;page='';fi;if [[ $page == 'Restart' ]];then restart_hold "restart";skip=0;page='';fi;if [[ $page == 'Remove' ]];then remove_printer;skip=0;page='';fi;if [[ $skip != '0' ]];then lprm $page;sleep .5;page='';fi;done;}

troubleshoot_device () { brand=$(zenity --forms --add-entry=Key --text='<span font="Liberation Mono">Enter printer Manuacturer name\nNote:- this Keyword is used for\nsearching only.Eg. HP \nis for Hewlett packward. \nType Canon for Canon printers. \nType in the command lpinfo -m in\n the terminal to get complete\n list of models as stored\nby your Linux Os.....</span>' --width=100 --title="Keyword" );uri_list=$(lpinfo -l -v | grep -i -B 4 -C 2 "make-and-model = "$brand | grep "uri =" | awk -F "uri = " '{print $2 }' | zenity --text="Listing Printer Uri\nCopy to clipboard" --height=400 --width=400 --title="Printer ID" --list --column=DeviceURI --ok-label="Copy" 2>/dev/null);echo $uri_list | xclip -selection clipboard ;} ;open_queue; while  zenity --question --text="Refresh Job queue?" --title="Queue" --width=70;do open_queue;done
#please change make-and-model code to list other printers as well (C)puneet bapna Thank YOU!
#please remove >/dev/nul after zenity if you want to view output of zenity command
#zenity --entry-text=HP is the default built in entry of Printer model name change it for ease of us
#Written with the help of Kwrite (c) kde

