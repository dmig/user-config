# user-config
A set of configs for fresh Linux install


## Sound
In GNOME 46 overamplification got hidden. Enable it like this:
```sh
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent 'true'
```

## Caps Lock layout switch and indicator
XKB options list is set in dconf key `org.gnome.desktop.input-sources/xkb-options`:
- 'grp:caps_toggle' -- switch layout
- 'grp_led:caps' -- use caps lock led
- 'compose:rctrl', 'eurosign:e', 'lv3:ralt_switch' -- other current settings
