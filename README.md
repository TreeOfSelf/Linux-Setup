# TreeOfSelf's Debian 13

## Graphics & Display

### NVIDIA Driver Installation
APT installation currently broken on Debian 13. Download driver directly from nvidia.com/drivers/unix

### X11 Multi-Monitor VSync
Solution: NVIDIA-X11 (github.com/vars1ty/NVIDIA-X11)
Note: VSync limited to single refresh rate across monitors. Set primary monitor to highest refresh rate.

### Monitor Configuration
Customize ~/.xinitrc with xrandr commands for your monitor layout.

## Hardware Issues

### Realtek USB WiFi Adapter
Adapter boots into CDROM mode by default. Fix:

1. Install usb-modeswitch
2. Create /etc/udev/rules.d/90-rtl8188gu.rules:
   ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", RUN+="/usr/sbin/usb_modeswitch -v 0bda -p 1a2b -J"
3. `sudo udevadm control --reload`
4. `sudo udevadm trigger`

## System Utilities

### Global Clipboard Management
Linux clipboard clears when applications closed, and isn't unified with st. Solution:
Install clipmenu and clipnotify. Configuration in `.xinitrc` to unify clipboard behavior across applications & save when closed.

### Caps Lock Key Behavior
https://github.com/TreeOfSelf/Linux-Capslock-Fix

### Fix Time Compatbility With Windows
Run `timedatectl set-local-rtc 1 --adjust-system-clock`

### Alt Codes for Linux
https://github.com/schorschii/AltCodes4Linux

## Browser Setup

### Ungoogled Chromium Segfault
File browser causes segfault. Install `xdg-desktop-portal-gtk` to resolve(?).  
Alternatively- all of the dep from `apt install chromium` should fix it but probably overkill.

### Setting Default Browser
Manual configuration required:

1. Create `~/.local/share/applications/ungoogled-chromium.desktop`:
   ```[Desktop Entry]
   Version=1.0
   Name=Ungoogled Chromium
   Exec=/home/username/ungoogled-chromium/chrome-wrapper %U
   Terminal=false
   Type=Application
   Icon=chromium
   Categories=Network;WebBrowser;
   MimeType=x-scheme-handler/unknown;x-scheme-handler/about;text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;```

2. Run: `xdg-settings set default-web-browser ungoogled-chromium.desktop`

## autostart.sh
Under `/home/.config/dwm/autostart.sh` you can configure programs to autostart. 

## Theming

Configure appearance through `.Xresources` and `~/.config/gtk-3.0/settings.ini`
Font for dwm: Tamzen (hardcoded in patch... probably not the best idea wwoops).

## Window Manager Customizations

### dwm Modifications
- Dark theme
- Tiled layout only
- New windows don't steal focus
- Click-to-focus (no hover)
- Windows key bindings (no Shift unless necessary)
- No urgent tabs

### st Modifications
- Scrollback support
- Improved text selection (no empty space highlighting)
- Enhanced copy/paste: right click copies selection or pastes if nothing selected
