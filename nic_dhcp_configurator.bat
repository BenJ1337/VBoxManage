@echo off

CALL paths.bat
CALL vars.bat



VBoxManage dhcpserver remove --ifname %HOST_ONLY%
VBoxManage dhcpserver add --ifname %HOST_ONLY% --ip 10.0.0.1 --netmask 255.255.255.0 --lowerip 10.0.0.100 --upperip 10.0.0.200
VBoxManage dhcpserver modify --ifname %HOST_ONLY% --enable