## Arch Installation Notes
---
[Arch ISO 2023.03.01](https://www.archlinux.org/download/)

notes to help install Arch Linux 
  - *not to be used as a complete installation guide*

follow [Arch Wiki Installation Guide](https://wiki.archlinux.org/index.php/Installation_guide) for full guidance

the [Arch Wiki](https://wiki.archlinux.org/) has lots of useful pages overall

[another useful install guide](https://www.gloriouseggroll.tv/arch-linux-efi-install-guide/)

##### Preparation in existing Linux installation:
- identify USB drive to load ISO on as e.g. `/dev/sda`
- load ISO on USB with e.g. `cat archlinux-version-x86_64.iso > /dev/sda`
- see [wiki page on USB medium](https://wiki.archlinux.org/title/USB_flash_installation_medium) for other options

##### Booting ISO
- insert ISO usb and put it to the top of boot order in BIOS menu
- boot into live usb
- set keyboard layout to match PC's
  - GB code `uk` so use `loadkeys uk`
- check `efivars` file so EFI installation will happen
- **need internet for install**
- easiest using ethernet until install is complete
  - `wifi-menu` is easiest for wifi though
  - `ping archlinux.org` to check connection
  - if connection not working, use [network wiki pages](https://wiki.archlinux.org/index.php/Network_configuration) and `enable daemon`

##### Partitions and mounting
- use `cfdisk` for [partitioning](https://wiki.archlinux.org/index.php/Partitioning)
  - find path to fresh partition made in Windows
  - `/dev/sdax`, find `x`
- format partition for Linux
  - `mkfs.ext4 /dev/sdax`
- mount main partition
  - `mount /dev/sdax /mnt`
- make boot directory for mounting
  - `mkdir /mnt/boot`
- mount boot partition
  - use existing *EFI partition* from Windows
  - should be `/dev/sda1` - can use `cfdisk` to check
  - `mount /dev/sda1 /mnt/boot`

##### Installation
- move mirrors from your country to top of `etc/pacman.d/mirrorlist`
  - use `vim` for basic editing -> `nano` is also an option but i hate it
- add `base-devel` to `pacstrap` command for main installation
- generate an `fstab` file
- `arch-chroot /mnt` into new system
- sort time zone
  - find your region and city
  - tab completion can help test which city nearby works
  - region: Europe; city: Berlin
- find and uncomment langauge in `/etc/locale.gen`
  - generate with `locale-gen` and set in `/etc/locale.conf`
- setting keymap permanently in `/etc/vconsole.conf` doesn't work for some reason
- install `dialog`, `networkmanager`, and `network-manager-applet` to help with wifi config in new system, using [pacman](https://wiki.archlinux.org/index.php/Pacman)
- **make sure to install** `intel-ucode`
- set root password with `passwd`

##### Bootloader
- `systemd-boot` is [simplest bootloader](https://wiki.archlinux.org/index.php/systemd-boot) - use `bootctl install`
- [can use others though](https://wiki.archlinux.org/index.php/Category:Boot_loaders)
  - **note:** many people use GRUB but it is pretty bloated and has had some issues recently
- edit `/boot/loader/entries/arch.conf`:  
```
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options root=/dev/sdax rw
```
* also edit `/boot/loader/loader.conf`:
```
timeout   7
default   arch
```

##### Post-installation set-up
- leave chroot environment by `exit` or `Ctrl+D`
- `reboot`
- more general advice on [Arch Wiki](https://wiki.archlinux.org/index.php/General_recommendations)
- `wifi-menu` or `nmtui` can be used for wifi
- `ip link` will name network interfaces
  - enabling interfaces will probably be required
  - wifi - `systemctl enable netctl-auto@wlpXs0`
  - ethernet - `systemctl enable netctl-ifplugd@epXs0`
- to add regular user:
  - need to be in `root` for this
  - `useradd -m -G wheel matthew` and `passwd matthew`
  - enter `visudo` and uncomment `wheel = ALL=(ALL) ALL`
- check video card with `lspci | grep -e VGA -e 3D`
  - install appropriate driver from [this table](https://wiki.archlinux.org/index.php/Xorg#Driver_installation)
- for installs, use [pacman](https://wiki.archlinux.org/index.php/Pacman) commands
- install `xorg xorg-xinit` and `rxvt-unicode rxvt-unicode-terminfo`
  - current `rxvt-unicode-9.31-1` version causes half-screen spacing before cursor appears
  - downgrade with `sudo pacman -U https://archive.archlinux.org/packages/r/rxvt-unicode/rxvt-unicode-9.30-1-x86_64.pkg.tar.zst` until fixed
  - another solution suggested in [forums](https://bugs.archlinux.org/task/77062?project=5&string=rxvt-unicode) but i'm lazy
- install [AUR](https://aur.archlinux.org/) helper
  - select one from [here](https://wiki.archlinux.org/index.php/AUR_helpers)
  - `pikaur` is the best one imo rn
  - see [github page](https://github.com/actionless/pikaur) for full details
- install windows manager
  * `i3-wm`, `polybar-git`, and `i3lock-color-git`
- clone dotfiles repo in `~/`
- install packages in `~/dotfiles/packages/`
  - pikaur for `AURpackages.txt`
  - pacman for `packages.txt`
- `cd ~/dotfiles` and use `stow` to symlink dotfiles
- use `echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699` to check if zsh theme will work
  - use [this](https://github.com/agnoster/agnoster-zsh-theme) if it doesn't work

###### Welcome to Arch Linux!
