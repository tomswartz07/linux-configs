# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
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

# Export Env Variables
PATH="/opt/android-sdk/platform-tools:${PATH}"
export PATH
export EDITOR=/usr/bin/vim
export TERM=rxvt-unicode-256color

setopt CORRECT
bindkey '^r' history-incremental-search-backward
bindkey '^[.' insert-last-word
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[3~' delete-char
#[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

alias pacman='sudo pacman'
alias ls='ls --color=auto'
alias tmux='tmux attach'
#alias pdflatex-watch='while true; do inotifywait -e modify $*.tex; pdflatex $*.tex; done'
function pdflatex-watch() { while true; do inotifywait -e modify "$1"; pdflatex "$1"; done;}
alias dusize="sudo du -hs * | sort -nr | head -10"
function bbcradio() { local s PS3="Select a station: ";select s in 1 1x 2 3 4 5 6 7 "Asian Network an" "Nations & Local lcl";do break;done;s=($s);mplayer -playlist "http://www.bbc.co.uk/radio/listen/live/r"${s[@]: -1}".asx";}
function cvbbcradio() { local s PS3="Select a station: ";select s in 1 1x 2 3 4 5 6 7 "Asian Network an" "Nations & Local lcl";do break;done;s=($s);cvlc "http://www.bbc.co.uk/radio/listen/live/r"${s[@]: -1}".asx";}

autoload -Uz vcs_info

#zstyle ':vcs_info:*' branchformat '%F{green}%b%f'
zstyle ':vcs_info:*' stagedstr ' %F{green}staged%f'
zstyle ':vcs_info:*' unstagedstr ' %F{red}unstaged%f'
zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
precmd () {
#    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats " [%b%c%u]"
        zstyle ':vcs_info:*' actionformats " [%b%c%u] %a"
#    } else {
#        zstyle ':vcs_info:*' formats "[%b%c%u]"
#    }

    vcs_info
}

setopt prompt_subst
PROMPT="┌──[%n@%m]──[%*]
└─▶ %~:%# "

# Notify if in SSH session
if [[ -z "$SSH_CLIENT" ]]; then
	RPROMPT='${vcs_info_msg_0_}%(?..%{$fg[red]%} [Error: %?]%{$reset_color%})%f'
else
	RPROMPT='%{$fg_bold[blue]%}[SSH]%{$reset_color%}${vcs_info_msg_0_}%(?..%{$fg[red]%} [Error: %?]%{$reset_color%})%f'
fi

archey3
