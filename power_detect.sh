#!/bin/bash
#This script auto check the gateway availability to get power status and shutdown host.
#run the service per 3 minuts and double check ping status if fail within 2 minutes. So make sure UPS can sustain 5 minuts.

let HtoGErr=0
read _ _ gateway _ < <(ip route list match 0/0); 
# Ping bridge 
ping -c 1 "$gateway" > /dev/null || ping -c 1 "$gateway" > /dev/null || HtoGErr=1 
if [ $HtoGErr -eq 1 ] 
then
  echo '!! Failed to ping gateway from host. sleep 2 minutes and try again. check at:'$(date) >> /var/log/ups.log
  sleep 110
  ping -c 1 "$gateway" > /dev/null || ping -c 1 "$gateway" > /dev/null || HtoGErr=2
  if [ $HtoGErr -eq 2 ] 
  then
    echo '!! Failed to ping gateway again. Power supply may fail. shutdown now at:'$(date) >> /var/log/ups.log
    shutdown -h now
  else
    echo 'power status ok! fail to ping gateway at first but restored. check at:'$(date) >> /var/log/ups.log
  fi
else 
  echo 'power status OK!check at:'$(date) >> /var/log/ups.log
fi
