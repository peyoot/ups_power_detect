#!/bin/bash
echo 'The script will install the ups-power-detect service to your system now. make sure you run this scripts in root'

cp power_detect.sh /usr/local/bin && echo 'power_detect.sh copied to /usr/local/bin'
chmod +x /usr/local/bin/power_detect.sh
cp ups-power-check.service /etc/systemd/system/
cp ups-power-check.timer /etc/systemd/system/
echo 'ups-power-detect service and timer installed'
rm -rf install.sh
echo 'please reboot or run "systemctl start ups-power-detect.timer" to enable the service'

