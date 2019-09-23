#!/bin/bash

exec 2>> /var/log/vds2cp_master.log

# -----------------------------------------------------------------------------
# get a list of VDS accounts on the server, maybe other variables
# -----------------------------------------------------------------------------

IFS=$'\n'
vdsusrlist=($(cat /etc/passwd|grep sphera|grep -vE 'sd.*admn'|awk -F':' '{print $1}'))

# -----------------------------------------------------------------------------
# Check if the /root directory exists, create if not
# -----------------------------------------------------------------------------

if [ ! -d /root ]
then
  mkdir /root
fi

# -----------------------------------------------------------------------------
# download the script to be used
# -----------------------------------------------------------------------------

wget -q --no-check-certificate https://raw.githubusercontent.com/stephenchaffins/VDS-to-cPanel-Migration-Scripts/master/vds2cp.sh -O /root/vds2cp.sh

# -----------------------------------------------------------------------------
# The stuff. Everything here is ran  inside the vds/as the user. Making the
# /root directory, copying the script to that root directory, chowning and
# chmoding the dir and script, and then finally running the script as the user
# -----------------------------------------------------------------------------

for i in "${vdsusrlist[@]}"
do
  echo -e "\e[33m\e[1m Making $i root directory... \e[0m";sleep 1; echo
    eval mkdir -p "~$i/root/"
  echo -e "\e[33m\e[1m Copying script to $i root directory... \e[0m";sleep 1; echo
    eval cp -a /root/vds2cp.sh "~$i/root/"
  echo -e "\e[33m\e[1m Chowning root directory to $i ownership... \e[0m";sleep 1; echo
    eval chown $i: -R "~$i/root/"
  echo -e "\e[33m\e[1m Running vds2cp.sh inside of $i VDS... \e[0m";sleep 1; echo
    eval su - $i -c './vds2cp.sh'
done
