#!/bin/bash


remove_printer () {
 echo Listing Printers..........;ass=$( lpstat -e |  zenity --list --column="Job ID" --column="User" --column="Queue" --column=File  --width=400 --height=700 --text="Printers" --title="$stats" --extra-button="URI"   2>/dev/null );page=$(echo $ass | awk '{print $1}');echo $ass;if [[ $page == 'URI' ]]; then if zenity --question --text="Open URI?"; then troubleshoot_device ;fi;else lpadmin -x $ass;fi;
}


restart_hold () { echo Starting Printer Job Queue..;stats=$1;no=$( lpq -a | wc -l );no=$(( no-1 ));ass=$( lpq -a | tail -n$no | awk -F " " '{ print $3"\n"$2"\n"$1"\n"$4}' |  zenity --list --column="Job ID" --column="User" --column="Queue" --column=File  --width=300 --height=400 --text="Press OK to $stats" --title="$stats"   2>/dev/null );page=$(echo $ass | awk '{print $1}');echo $ass;if [[ $page == '' ]];then page='x';echo nothing ;else echo echoing lp -i $ass -H $stats;lp -i $ass -H $stats;fi;};

open_queue () { skip=1;echo Starting Printer Job Queue..;page='';while [[ $page == '' ]]; do var="hello bye Click Here";no=$( lpq -a | wc -l );no=$(( no-1 ));ass=$( lpq -a | tail -n$no | awk -F " " '{ print $3"\n"$2"\n"$1"\n"$4}' |  zenity --list --column="Job ID" --column="User" --column="Queue" --column=File  --width=400 --height=400 --text='<b>select Job id</b> to <b>KILL</b>\t<span foreground="grey" font="10">Please Cancel the Job from Printer if it is already initiated</span>\n<i>Cancel Refreshes Queue</i>' --title="Printer Job Queue" --extra-button="Exit" --extra-button="Hold" --extra-button="Release" --extra-button="Restart" --extra-button="Remove Printer" 2>/dev/null );page=$(echo $ass | awk '{print $1}');echo $ass;if [[ $page == '' ]] ;then echo do nothing;skip=0;fi;if [[ $page == 'Exit' ]]; then  page='x';fi;if [[ $page == 'Hold' ]];then restart_hold "hold"   ;skip=0;page='';fi;if [[ $page == 'Release' ]];then restart_hold "resume";skip=0;page='';fi;if [[ $page == 'Restart' ]];then restart_hold "restart";skip=0;page='';fi;if [[ $page == 'Remove' ]];then remove_printer;skip=0;page='';fi;if [[ $skip != '0' ]];then lprm $page;fi;done;}

troubleshoot_device () { brand=$(zenity --entry --entry-text=HP --text="Enter brand name\n For Eg. HP for hewlett packward.\n type lpinfo -m in terminal to get list of models as stored by Linux Os" );uri_list=$(lpinfo -l -v | grep -i -B 4 -C 2 "make-and-model = "$brand | grep "uri =" | awk -F "uri = " '{print $2 }' | zenity --text="Listing Printer Uri\nCopy to clipboard" --height=400 --width=400 --title="Printer ID" --list --column=DeviceURI 2>/dev/null);echo $uri_list | xclip -selection clipboard ;} ;open_queue; while  zenity --question --text="Refresh Job queue?" --width=70;do open_queue;done
#please change make-and-model code to list other printers as well (C)puneet bapna Thank YOU!
#please remove >/dev/nul after zenity if you want to view output of zenity command
#zenity --entry-text=HP is the default built in entry of Printer model name change it for ease of us
#Written with the help of Kwrite (c) kde

