# TreeOfSelf's Debian 13 Setup

## nvidia-driver
Installing through apt is broken on Debian 13 (currently at least?)  
https://www.nvidia.com/en-us/drivers/unix/  
Download directly from here.     

# x11 multi-monitor vsync annoyances   
https://github.com/vars1ty/NVIDIA-X11 
mostly "solved" through this. Although you will ALWAYS be limited to one vsync refresh rate, I just made it my primary monitor (the highest)   

## Monitor setup  
You will need to customize `/home/.xinitrc` to whatever your monitor setup is using `xrandr`

## Realtek USB wifi adapter nonsense 
USB boots into CDROM mode sometimes. Install usb-modeswitch   
`sudo nano /etc/udev/rules.d/90-rtl8188gu.rules`  
```ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", "RUN+="/usr/sbin/usb_modeswitch -v 0bda -p 1a2b -J"```   
This makes it so on boot and USB plugin, it switches to proper mode.   

## Global clipboard
Linux has a really jank clipboard implementation. Close a program, clipboard is gone. And st has a seperate clipboard that works terribly.   
To fix this, install clipmenu & clipnotify. Then the script in `.xinitrc` will handle unifying one global clipboard and making it so it won't forget when programs close.

## Capslock nonsense  
Linux has a long-standing bug with Caps lock key having weird behavior. When enabling capslock, it instantly enables on keydown. But when DISABLING capslock, it only disables when the key is actually released. `.xinitrc` has a script to run capslock-fix.sh to fix this

## Theming 
Theming in linux is a bit all over the place. I was able to get most of the theming I wanted using `.Xresources` & `~/.config/gtk-3.0/settings.ini`   
For my themeing, I used Tamzen font but you could use anything (you will have to also update the dwm/st patches).

## dwm changes   
Dark themed, tiled ONLY, new windows don't take primary, CLICK to focus (no hover nonsense), Windows key  AND no SHIFT unless needed. 

## st changes
scrollback, WAY better highlighting (you dont highlight blank stuff), BETTER copying middle/right click, either copy whats highlighted or paste if nothing highlighted.
