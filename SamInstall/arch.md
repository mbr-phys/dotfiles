# Arch Installation - brief notes
Arch ISO - 01.07.2017

These are some notes to help me with installing Arch and adding dotfiles


**Before booting USB:**
* use Rufus tool to make bootable USB on Windows
* turn off secure boot in BIOS

For Windows dual boot:
* create the partitions in Windows before booting into USB
* turn off Fastboot in Windows (go to Power Options)


**Pre-Installation**
* ISO keyboard layout is `uk` (so `loadkeys uk`)
* `wifi-menu` is the easiest tool to use for network connectivity. Just use wired internet if the only network available is WPA Enterprise
* use `cfdisk` for partitioning
* if dual-booting Windows, mount the existing EFI partition to `/mnt/boot` and install bootloader to there like normal

**Installation**
* install `base-devel` in main installation
* for time zone: region is Europe, zone is London
* setting key layout in `vconsole.conf` never works for some reason
* install `dialog`, `networkmanager` and `network-manager-applet` with other network tools for use of more network options in new system
* don't forget to install `intel-ucode`

**Bootloader**
* `systemd-boot` is easiest boot manager - install with `bootctl install`
* put the following in `/boot/loader/entries/arch.conf`:
```
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options root=/dev/sdxy rw
```
* and the following in `/boot/loader/loader.conf`:
```
timeout 5
default arch
```


**In new system**

* use `wifi-menu` or `nmtui` for a connection
* use `ip link` to find names of network interfaces, then: `systemctl enable netctl-auto@wlpXs0` and `systemctl enable netctl-ifplugd@enpXs0`


* to add user `useradd -m -G wheel samuel` and `passwd samuel`
* uncomment `wheel = All=(ALL) ALL` from `visudo` (might need to clarify to use `vim` at this point)


* check video driver and install the correct one
* install `xorg xorg-xinit`
* install `rxvt-unicode rxvt-unicode-terminfo`

* install AUR helper using `makepkg -si` (`cower` and then `pacaur`)


* install `i3-gaps-git`, `i3blocks-gaps-git` and `i3lock-color-git` from AUR
* clone the dotfiles repository to `~/Dotfiles`
* use `stow` to symlink the dotfiles to the correct locations


* install `zsh` and `oh-my-zsh`
* install packages from `packages*.txt`
* `apm install sync-settings` and add gist ID and access token in Atom
* change firefox settings/addons using `firefox.md`
* apply Spotify theme using graphical version of oomox (command line version rarely works)



**Fixes**

* refind fix `efibootmgr -c -d /dev/da -l \\EFI\\refind\\refind_x64.efi -L rEFInd`


* xbacklight: add the following to `/etc/X11/xorg.conf`:
```
Section "Device"
    Identifier  "Card0"
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection
```


**Useful Links**
* [Wiki: Installation Guide](https://wiki.archlinux.org/index.php/installation_guide)
* [Wiki: Windows Dual Boot](https://wiki.archlinux.org/index.php/Dual_boot_with_Windows)
* [Wiki: Boot Loader](https://wiki.archlinux.org/index.php/systemd-boot)
* [A helpful Arch installation guide](https://tutos.readthedocs.io/en/latest/source/Arch.html)
* [Old Beginner's Guide](https://csdietz.github.io/arch-beginner-guide/)


* [Wiki: General Recommendations](https://wiki.archlinux.org/index.php/General_recommendations)
* [Wiki: List Of Applications](https://wiki.archlinux.org/index.php/List_of_applications)
