### Dotfiles for Arch Linux

#### general windows management

* [i3-wm](https://i3wm.org/) 
* [polybar](https://github.com/polybar/polybar) 
* [i3lock-color](https://github.com/chrjguill/i3lock-color) - i3lock with more customisation

#### fonts and colouring

* mixture of [gruvbox](https://github.com/morhetz/gruvbox) and base16-tomorrow-night
* gtk theme
* regular font - [overpass](http://overpassfont.org/)
* terminal font - [FuraMono Nerd Font](https://github.com/ryanoasis/nerd-fonts)

#### browser

* browser is firefox, customised with `userChrome.css` 

#### terminal

* emulator is [urxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode)
* shell is [zsh](https://wiki.archlinux.org/index.php/zsh)
* shell prompt is custom, see [zshrc](https://github.com/mbr-phys/dotfiles/blob/master/zsh/.zshrc)

#### utilities

* editors - vim
* pdf viewer - [zathura](https://pwmt.org/projects/zathura/)
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
