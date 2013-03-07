#!/bin/sh
#
# Author: peondusud
#
# Shell for wardriving on Debian
#


# Make sure only root can run our script

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
echo " "
echo "[Installing  packages]"
echo " "
apt-get install git linux-headers-$(uname -r) g++ libncurses-dev libpcap-dev libnl-dev build-essential wireshark make gpsd bluetooth bluez bluez-utils googleearth-package python
echo " "
echo "[Clonning kismet depot]"
echo " "
git clone https://www.kismetwireless.net/kismet.git
echo " "
echo "[Start installing  kismet]"
echo " "
cd kismet/
./configure
make dep
make
make install
echo " "
echo " "
echo "*********************GPS bluetooth section*******************************"
echo "*************************************************************************"
echo " "
echo "to see bluetooth device type : hcitool dev"
echo "if there is no device try to check messages about bluetooth using dmesg,or lsmod"
echo "to start scanning bluetooth devices type : hcitool scan"
echo "to attach bluetooth devices type : rfcomm bind /dev/rfcomm0 @GPS_MAC"
echo " "
echo "*************************************************************************"
echo "*************************************************************************"
echo " "
echo " "
echo "*********************GPS USB section*************************************"
echo "*************************************************************************"
echo " "
echo "to check baudrate USBtty device type : sudo cat /dev/ttyUSBx"
echo "to change baudrate USBtty device type : sudo stty -F /dev/ttyUSBx \$SPEED"
echo " "
echo "*************************************************************************"
echo "*************************************************************************"
echo " "
echo " "
echo "***************************GPSd  section*********************************"
echo "*************************************************************************"
echo " "
echo "to attach USB GPS, type : gpsd -N -B /dev/ttyUSBx"
echo "to attach bluetooth GPS, type : gpsd -N -B /dev/rfcomm0"
echo "check listen port, type : netstat -ntaup"
echo "to check if it works you can try : telnet localhost 2947"
echo " "
echo "*************************************************************************"
echo "*************************************************************************"
echo " "
echo " "
echo "***************************kismet section********************************"
echo "*************************************************************************"
echo " "
echo "kismet is installed in /usr/local/bin, type kismet or update your PATH"
echo "you must configure the configuration file /usr/local/etc/kismet.conf"
echo "check these entries:"
echo " "
echo "  gps=true"
echo " "
echo "************for gpsd***********"
echo "  gpstype=gpsd"
echo "  gpshost=localhost:2947"
echo " "
echo "***********for bluetooth*******"
echo "  gpstype=serial"
echo "  gpsdevice=/dev/rfcomm0"
echo " "
echo "***********for serial**********"
echo "  gpstype=serial"
echo "  gpsdevice=/dev/ttyUSBx"
echo " "
echo " "
echo "*************************************************************************"
echo "*************************************************************************"
echo " "
echo " "
echo "************************usage of netxml2kml******************************"
echo "*************************************************************************"
echo " "
echo "use the python script to tranform netxml, netpcap,.. to kml file"
echo "type : python netxml2kml.py --kml -o \$output_file \$source_folder"
echo " "
echo "*************************************************************************"
echo " "
echo " "
exit 1
