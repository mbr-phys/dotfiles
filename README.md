### Dotfiles for Arch Linux

Most of this has been taken from a friend's configs and then customised for my own preferences, some stuff also just from across the internet

---

#### general windows management

* [i3-gaps](https://github.com/Airblader/i3) - fork of i3 windows manager that incorporates gaps
* [i3blocks-gaps](https://github.com/Airblader/i3blocks-gaps) - fork of i3blocks to work with i3-gaps
* [i3lock-color](https://github.com/chrjguill/i3lock-color) - i3lock with more customisation

#### fonts and colouring

* mixture of [gruvbox](https://github.com/morhetz/gruvbox) and base16-tomorrow-night
* gtk theme
* regular font - [overpass](http://overpassfont.org/)
* terminal font - [hack](https://sourcefoundry.org/hack/)

#### browser

* browser is firefox, customised appearance with `userChrome.css` - recommended by friend

#### terminal

* emulator is [urxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode), shell is [zsh](https://wiki.archlinux.org/index.php/zsh)
* shell prompt is [agnosters theme](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes)

#### utilities

* editors - [atom](https://atom.io/) and vim installed, mainly using atom
* pdf viewer - [zathura](https://pwmt.org/projects/zathura/), also using firefox and atom sometimes
* notifications - [dunst](https://dunst-project.org/)
* launcher - [rofi](https://davedavenport.github.io/rofi/)

#### packages

* for a recorded list of all installed packages:
	- `pacman -Qqen > ~/dotfiles/packages/packages.txt` for [official Arch](https://www.archlinux.org/packages/) packages
	- `pacman -Qqem > ~/dotfiles/packages/aurpackages.txt` for [aur packages](https://aur.archlinux.org/)

---

#### Symlinking

[_a useful guide for explaining symlinks with stow_](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

- install gnu stow to allow simple symlinks

- put config files into a single (git) folder in the structure above

- change into repo and use `stow [package name]` to link into config location e.g. `stow zathura` creates a symlink to `~/.config/zathura`
