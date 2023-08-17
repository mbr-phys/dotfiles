
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

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
source ~/.local/share/fonts/i_fa.sh
source /home/matthew/gpt/lib/cgpt/build/source.sh

EDITOR=vim
DEFAULT_USER="matthew"

alias please='sudo $(fc -ln -1)'
alias e="exit"
alias rm='rm -i'
alias ll='ls -ltr'
alias lh='ls -ltrh'
alias neotidy="clear && echo && neofetch"
alias dirs='dirs -v'

alias g="git"
alias ga="git add"
alias gu="git add -u"
alias gst="git status"
alias gcm="git commit -m"
alias gp="git push"
alias gc="git checkout"

alias klq="kinit -r 7d mblack@FNAL.GOV && ssh mblack@lq.fnal.gov"
alias lq="ssh mblack@lq.fnal.gov"
alias sshi="ssh -i ~/.ssh/mkb-root-key"
alias omni="ssh mb962356@omni.zimt.uni-siegen.de"
alias iodine="ssh -J black@login1.tp.nt.uni-siegen.de black@iodine.tp.nt.uni-siegen.de"
alias bromine="ssh -J black@login1.tp.nt.uni-siegen.de black@bromine.tp.nt.uni-siegen.de"
alias xenon="ssh -J black@login1.tp.nt.uni-siegen.de black@xenon.tp.nt.uni-siegen.de"
alias rubidium="ssh -J black@login1.tp.nt.uni-siegen.de black@rubidium.tp.nt.uni-siegen.de"
alias rbc="ssh mblack@qcdserver13.phys.columbia.edu"
alias columbia="ssh mblack@cuth00.phys.columbia.edu"
alias rhqrep="git clone mblack@cuth00.phys.columbia.edu:/home/witzel/RepositoryRHQ.git"
alias tursa="ssh dc-blac1@tursa.dirac.ed.ac.uk"
alias lumi="ssh -i .ssh/lumi-key blackmat@lumi.csc.fi"

alias syncBsDs="rsync -av --exclude notes/ black@login1.tp.nt.uni-siegen.de:BstoDs ."
alias pushBsDs="rsync -av notes black@login1.tp.nt.uni-siegen.de:BstoDs"

alias /="cd /"
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias conf="cd ~/dotfiles/i3/.config/i3/"
alias sieg="cd ~/library/Siegen/"
alias hdm="cd ~/library/Siegen/2HDM/"
alias higgs="cd ~/library/Siegen/2HDM/higgs-proj/"
alias lat="cd ~/library/Siegen/LQCD/LatticeAnalyser/"
alias qcd="cd ~/library/Siegen/LQCD/"
alias gfr="cd ~/library/Siegen/LQCD/GFRenorm/"
alias quc="cd ~/library/Siegen/QuantumComputing/"
alias tex="cd ~/library/Durham/TeX-Notes/Year\ 4/"
alias lib="cd ~/library/"
alias misc="cd ~/library/misc/"
alias pif="zathura ~/library/LaTeX-Templates/assorted/pifont.pdf"
alias dots="cd ~/dotfiles/"
alias zs="cd ~/dotfiles/zsh/"
alias zsv="vim ~/dotfiles/zsh/.zshrc"
alias vs="cd ~/dotfiles/vim"
alias poly="cd ~/dotfiles/polybar/.config/polybar/"

alias firefox="GTK_THEME=Adwaita:light firefox"
#alias vim="vim --servername VIM"
alias zathura="zathura --fork"
alias z="zathura"
alias pdflatexd="pdflatex -output-directory=./latex-output"

function psc() {
    pass show -c $1
}

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

    rc_indicator='%(0?.%F{blue}%(!.#.)%F{default}.%F{9}%(!.#.)%F{default})'

    # first line
    p_elem+='%F{251}%n%F{251}'
    p_elem+=' '
    p_elem+='%F{blue}[%F{blue}${PWD/#$HOME/~}%F{blue}]'
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
for X in {command,alias}; do ZSH_HIGHLIGHT_STYLES[$X]=fg=10; done
