# TreeOfSelf's Debian 13 Setup

## nvidia-driver
Installing through apt is broken on Debian 13 (currently at least?)  
https://www.nvidia.com/en-us/drivers/unix/  
Download directly from here.  

## realtek USB wifi adapter nonsense 
USB boots into CDROM mode sometimes. Install usb-modeswitch   
`sudo nano /etc/udev/rules.d/90-rtl8188gu.rules`  
`ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", "RUN+="/usr/sbin/usb_modeswitch -v 0bda -p 1a2b -J"`   
This makes it so on boot and USB plugin, it switches to proper mode.   
