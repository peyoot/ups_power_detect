#  Linux Server / Promox VE / TrueNAS UPS power supply autocheck and auto shutdown server while power is down.
This script can be used to auto-shutdown Debian/Ubuntu Server while UPS power supply is down. Not all UPS have communication interface to shutdown the server. But we can use scripts to detect if Network router/gateway is available or not and thus use this information to shutdown server gracefully.

## usage

Ubuntu
```shell
git clone https://github.com/peyoot/ups_power_detect.git
cd ups_power_detect
sudo chmod +x ./install.sh
sudo ./install.sh
```

Debian |PVE |Truenas
```shell
git clone https://github.com/peyoot/ups_power_detect.git
cd ups_power_detect
su -
chmod +x ./install.sh
./install.sh
```

