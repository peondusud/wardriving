Wardriving
==========


Kismet
======

Kismet is an 802.11 layer2 wireless network detector, sniffer, and intrusion detection system. Kismet will work with any wireless card which supports raw monitoring (rfmon) mode, and (with appropriate hardware) can sniff 802.11b, 802.11a, 802.11g, and 802.11n traffic. Kismet also supports plugins which allow sniffing other media such as DECT.

Kismet identifies networks by passively collecting packets and detecting standard named networks, detecting (and given time, decloaking) hidden networks, and infering the presence of nonbeaconing networks via data traffic. 
http://www.kismetwireless.net/

netxml2kml
==========

http://www.salecker.org/software/netxml2kml/en
netxml2kml is a Python (2.6) script that can create KML or/and KMZ files for Google Earth from one ore more netxml files of Kismet Newcore (>=2009-06-R1). The Converter can read files or entire folders with netxml files.

When you open the KML/KMZ file in Google Earth, eg. for checking your Wardriving tour, you can chose which sort of encryption it will show.

The converted file includes the following properties:

    SSID
    BSSID/MAC
    Type
    Channel
    Encryption
    GPS Coordinates


Kismon
======

http://www.salecker.org/software/kismon/en
Kismon is a PyGTK Kismet Newcore (ab 2009-05-RC1) client that creates a live map of the networks. 


gps2gpx
=======

Converting Kismet .gps files to gpx
For other wardrivers, wanting to convert their kismet.gps logs to gpx format, I'm posting the converter written by Christopher Schmidt here.
Copy the above to a file, save as kismet2gpx.py, set execute permission. Usage is "cat kismet.gps|grep -v DOCTYPE|./kismet2gpx.py > kismet.gpx" 

Android pCap
===========
Android PCAP Capture is a utility for capturing raw 802.11 frames (“Monitor mode”, or sometimes referred to as “Promiscuous mode”). The resulting Pcap files can be viewed on a computer using Eye P.A., Wireshark, Tcpdump and similar tools, or online using CloudShark.

Android PCAP works with Android phones running version 4 (ICS) or higher and Wi-Fi cards that use the RTL 8187 chipset. 
http://www.kismetwireless.net/android-pcap/