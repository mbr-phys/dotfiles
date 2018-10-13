
ZSH=/usr/share/oh-my-zsh/

ZSH_THEME=""
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
source ~/.local/share/fonts/i_fa.sh

DEFAULT_USER="matthew"

alias please='sudo $(fc -ln -1)'
alias e="exit"
alias rm='rm -i'
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
alias tex="cd ~/library/TeX-Notes/Year\ 3/"
alias notes="cd ~/library/PDF-Notes/Year\ 3/"
alias lib="cd ~/library/"
alias misc="cd ~/library/misc/"
alias cyb="cd ~/library/misc/dnd/cyber/"
alias bar="cd ~/library/misc/bar/"
alias quark="cd ~/library/quarkonium/"
alias labs="cd ~/library/Labs/"
alias dots="cd ~/dotfiles/"
alias zs="cd ~/dotfiles/zsh/"
alias zsv="vim ~/dotfiles/zsh/.zshrc"
alias vs="cd ~/dotfiles/vim"
alias poly="cd ~/dotfiles/polybar/.config/polybar/"

alias firefox="GTK_THEME=Adwaita:light firefox"
alias vim="vim --servername VIM"
alias zathura="zathura --fork"
alias pdflatexd="pdflatex -output-directory=./latex-output"
alias steam="flatpak run com.valvesoftware.Steam"

#this is mostly stolen then tweaked from a friend
autoload -Uz promptinit && promptinit

setopt promptsubst
autoload -U add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr '△'
zstyle ':vcs_info:*:*' stagedstr '▲'
zstyle ':vcs_info:hg:*' get-mq true
zstyle ':vcs_info:hg:*' get-bookmarks true
zstyle ':vcs_info:*:*' actionformats "%S" "(%s)/%r at %b %u%c (%a)"
zstyle ':vcs_info:*:*' formats "%S" "(%s)/%r at %b %u%c"
zstyle ':vcs_info:*:*' nvcsformats "%~" ""

add-zsh-hook precmd vcs_info

function () {
    local -a p_line p_elem rc_indicator

    rc_indicator='%(0?.%F{014}%(!.#.)%F{default}.%F{167}%(!.#.)%F{default})'

    # first line
    p_elem+='%F{251}%n%F{251}'
    p_elem+=' '
    p_elem+='%F{014}[%F{004}${PWD/#$HOME/~}%F{014}]'
    p_line+=${(j::)p_elem}

    # second line
    p_line+="${rc_indicator} "

    # prompts
    PROMPT=${(F)p_line}
    RPROMPT='%F{242}${vcs_info_msg_1_}%F{default}'
}


ZSH_HIGHLIGHT_STYLES[precommand]=fg=10
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=208
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=166
for X in {command,alias}; do ZSH_HIGHLIGHT_STYLES[$X]=fg=2; done
