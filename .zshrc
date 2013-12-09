# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tom/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -U promptinit
promptinit
autoload -U colors
colors

PATH="/opt/android-sdk/platform-tools:${PATH}"
export PATH

setopt CORRECT
bindkey '^r' history-incremental-search-backward
bindkey '^[.' insert-last-word
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[3~' delete-char
#[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

alias ls='ls --color=auto'
alias pdflatex-watch='while true; do inotifywait -e modify *.tex; pdflatex *.tex; done'
alias dusize="sudo du -hs * | sort -nr | head -10"
function bbcradio() { local s PS3="Select a station: ";select s in 1 1x 2 3 4 5 6 7 "Asian Network an" "Nations & Local lcl";do break;done;s=($s);mplayer -playlist "http://www.bbc.co.uk/radio/listen/live/r"${s[@]: -1}".asx";}
function cvbbcradio() { local s PS3="Select a station: ";select s in 1 1x 2 3 4 5 6 7 "Asian Network an" "Nations & Local lcl";do break;done;s=($s);cvlc "http://www.bbc.co.uk/radio/listen/live/r"${s[@]: -1}".asx";}

export EDITOR=/usr/bin/vim

autoload -Uz vcs_info

#zstyle ':vcs_info:*' branchformat '%F{green}%b%f'
zstyle ':vcs_info:*' stagedstr ' %F{green}staged%f'
zstyle ':vcs_info:*' unstagedstr ' %F{red}unstaged%f'
zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
#    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats "[%b%c%u]"
#    } else {
#        zstyle ':vcs_info:*' formats "[%b%c%u]"
#    }

    vcs_info
}

setopt prompt_subst
PROMPT="┌──[%n@%m]──[%*]
└─> %~:%# "
RPROMPT='${vcs_info_msg_0_}%(?..%{$fg[red]%}[Error: %?]%{$reset_color%})%f'

archey
