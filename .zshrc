# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history
setopt autocd
unsetopt beep
setopt correct
setopt complete_in_word
setopt always_to_end
setopt complete_aliases
setopt list_ambiguous

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
autoload -U compinit
compinit
zmodload -i zsh/complist

# Export Env Variables
PATH="/opt/android-sdk/platform-tools:${PATH}"
PATH="/home/tom/.gem/ruby/*/bin:${PATH}"
GOPATH="/home/tom/.go/"
export PATH
export GOPATH
export EDITOR=/usr/bin/vim
#export TERM=rxvt-unicode-256color

bindkey -v
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^[.' insert-last-word
bindkey '^[OH' beginning-of-line
bindkey '^[[7~' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[3~' delete-char
#[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

alias pacman='sudo pacman'
alias packer='pacaur'
alias ls='ls --color -lhSAv --group-directories-first'
alias tmux='tmux attach'
alias dusize="sudo du -hs * | sort -nr | head -10"
function pdflatex-watch() { while true; do inotifywait -e modify "$1"; pdflatex "$1"; done;}
function bbcradio() { local s PS3="Select a station: ";select s in 1 1x 2 3 4 5 6 7 "Asian Network an" "Nations & Local lcl";do break;done;s=($s);mplayer -playlist "http://www.bbc.co.uk/radio/listen/live/r"${s[@]: -1}".asx";}
function cvbbcradio() { local s PS3="Select a station: ";select s in 1 1x 2 3 4 5 6 7 "Asian Network an" "Nations & Local lcl";do break;done;s=($s);cvlc "http://www.bbc.co.uk/radio/listen/live/r"${s[@]: -1}".asx";}
function macaddr() { echo "$1" | sed -e 's/\([0-9A-Fa-f]\{2\}\)/\1:/g' -e 's/\(.*\):$/\1/' }

#eval "$(dircolors -b)"
eval "$(dircolors ~/.dircolors)"
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-dirs-first yes
zstyle ':completion:*' file-list list=20 insert=10
zstyle ':completion:*' file-sort modification=time
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps -au $USER'
zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall' force-list always

autoload -Uz vcs_info
#zstyle ':vcs_info:*' branchformat '%F{green}%b%f'
zstyle ':vcs_info:*' stagedstr ' %F{green}staged%f'
zstyle ':vcs_info:*' unstagedstr ' %F{red}unstaged%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats "[%b%c%u%m]"
zstyle ':vcs_info:*' actionformats "[%b%c%u] %a"
zstyle ':vcs_info:*' actionformats "[%b%c%u %F{yellow}%a%f]"
precmd () {
    vcs_info
}

# Vim Mode Settings
#
# `vim_insert_mode` is normal input. Can contain message, or be blank
# `vim_command_mode` is displayed when Vi command mode is activated.
#
# If only command mode is set, then message will only appear if cmd mode is activated.

#vim_insert_mode="%{$fg[cyan]%} [INS]%{$reset_color%}"
vim_insert_mode=""
vim_command_mode="%{$fg[yellow]%}[CMD]%{$reset_color%}"

function zle-line-init zle-keymap-select {
        vim_mode="${${KEYMAP/vicmd/${vim_command_mode}}/(main|viins)/${vim_insert_mode}}"
        zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

setopt prompt_subst
PROMPT="┌──[%n@%m]──[%*]
└─▶ %~:%# "

# Notify if in SSH session
if [[ -z "$SSH_CLIENT" ]]; then
        RPROMPT='${vcs_info_msg_0_}${vim_mode}%(?..%{$fg[red]%}[Error: %?]%{$reset_color%})%f'
else
        RPROMPT='%{$fg_bold[blue]%}[SSH]%{$reset_color%}${vcs_info_msg_0_}${vim_mode}%(?..%{$fg[red]%}[Error: %?]%{$reset_color%})%f'
fi

# Highlight brackets, requires zsh-syntax-highlighting package
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets)

archey3
