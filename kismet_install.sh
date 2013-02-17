#!/bin/sh
#@peondusud
#Shell for wardriving on Debian
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Installing  packages"
aptitude install git linux-headers-$(uname -r) g++ libncurses-dev libpcap-dev libnl-dev build-essential wireshark make gpsd bluetooth bluez bluez-utils googleearth-package python
echo "clonning kismet depot"
git clone https://www.kismetwireless.net/kismet.git
echo "start installing  kismet"
cd kismet/
./configure
make dep
make
make install

echo " "
echo "*********************GPS bluetooth section*******************************"
echo "*************************************************************************"
echo "to see bluetooth device type : hcitool dev"
echo "if no device try to check messages about bluetooth dmesg,or lsmod"
echo "to start scanning bluetooth devices type : hcitool scan"
echo "to attach bluetooth devices type : rfcomm bind /dev/rfcomm0 @GPS_MAC"
echo "*************************************************************************"
echo " "
echo "*********************GPS USB section*************************************"
echo "*************************************************************************"
echo "to check baudrate USBtty device type : sudo cat /dev/ttyUSBx"
echo "to change baudrate USBtty device type : sudo stty -F /dev/ttyUSBx \$SPEED"
echo "*************************************************************************"
echo " "
echo "***************************GPSd  section*********************************"
echo "*************************************************************************"
echo "to attach USB GPS, type : gpsd -N -B /dev/ttyUSBx"
echo "to attach bluetooth GPS, type : gpsd -N -B /dev/rfcomm0"
echo "check listen port, type : netstat -ntaup"
echo "to check if it's work you can try : telnet localhost 2947"
echo "*************************************************************************"
echo " "
echo " "
echo "***************************kismet section********************************"
echo "*************************************************************************"
echo "kismet is installed /usr/local/bin, type kismet or update your PATH"
echo "you must configure the configuration file /usr/local/etc/kismet.conf"
echo "check this entries:"
echo "  gps=true"
echo "************for gpsd***********"
echo "  gpstype=gpsd"
echo "  gpshost=localhost:2947"
echo "***********for bluetooth*******"
echo "  gpstype=serial"
echo "  gpsdevice=/dev/rfcomm0"
echo "***********for serial**********"
echo "  gpstype=serial"
echo "  gpsdevice=/dev/ttyUSBx"
echo "*************************************************************************"
echo " "
echo " "
echo "use python file to tranform netxml, netpcap,.. to kml file"
echo "type : python netxml2kml.py --kml -o \$output_file \$source_folder"

exit 0