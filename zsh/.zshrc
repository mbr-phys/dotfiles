
ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
plugins=(git)
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

powerline-daemon -q
. /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

alias please='sudo $(fc -ln -1)'
alias e="exit"
alias neotidy="clear && echo && neofetch"
alias dirs='dirs -v'

alias g="git"
alias ga="git add"
alias gst="git status"
alias gcm="git commit -m"
alias gp="git push"
alias gc="git checkout"

alias /="cd /"
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias conf="cd ~/dotfiles/i3/.config/i3/"
alias notes="cd ~/library/TeX-Notes/Year\ 2/"
alias lib="cd ~/library/"
alias misc="cd ~/library/Misc/"
alias labs="cd ~/library/Labs/Year\ 2/"
alias dots="cd ~/dotfiles/"
alias zs="cd ~/dotfiles/zsh/"
alias poly="cd ~/dotfiles/polybar/.config/polybar/"

alias firefox="GTK_THEME=Adwaita:light firefox"
alias vim="vim --servername VIM"
alias zathura="zathura --fork"
alias pdflatexd="pdflatex -output-directory=./latex-output"
