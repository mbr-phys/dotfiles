### Dotfiles for Arch Linux

Most of this has been taken from a friend's configs and then customised for my own preferences, some stuff also just from across the internet

---

#### general windows management

* [i3-gaps](https://github.com/Airblader/i3) - fork of i3 windows manager that incorporates gaps
* i3blocks
* i3lock

#### fonts and colouring

* mixture of gruvbox and base16-tomorrow-night
* gtk theme
* regular font in use is overpass
* font used for terminal is hack

#### browser

* browser is firefox, customised appearance with `userChrome.css` - recommended by friend

#### terminal

* emulator is urxvt, shell is zsh
* shell prompt is gallifrey theme, would use agnoster's but can't get it to work?

#### utilities

* editors - both atom and vim installed, mainly using atom
* pdf viewer - zathura, also using firefox and atom sometimes
* notifications - dunst
* launcher - rofi

---

#### Symlinking

- install gnu stow to allow simple symlinks

- put config files into a single (git) folder in the structure above

- change into repo and use `stow [package name]` to link into config location e.g. `stow zathura` creates a symlink to `~/.config/zathura`
