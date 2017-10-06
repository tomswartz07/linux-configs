# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
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
PATH=$(ruby -rubygems -e "puts Gem.user_dir")/bin:${PATH}
RUBY_PATH="$(ruby -rubygems -e "puts Gem.user_dir")/bin"
SPRUCE_PATH="/usr/local/bin"
GOPATH="/home/tom/.go/"
export PATH
export GOPATH
export RUBY_PATH
export SPRUCE_PATH
export EDITOR=/usr/bin/vim
#export TERM=rxvt-unicode-256color

# Keybindings
bindkey -v
bindkey '^r' history-incremental-pattern-search-backward # CTRL+R
bindkey '^[.' insert-last-word    # ESC+.
bindkey '^[[7~' beginning-of-line # HOME
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[8~' end-of-line       # END
bindkey '^[[3~' delete-char       # DEL
bindkey '^B' backward-word        # CTRL+B
bindkey '^F' forward-word         # CTRL+F

#[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

# Aliases and functions

# Auto-Sudo for package manager
alias pacman='sudo pacman'
alias packer='pacaur'

# Automatically make it a private Gist and copy Gist URL
# Requires https://github.com/defunkt/gist
alias gist='gist -c -p'

# Add the -O flag to open files in vsplits with Vim
alias vim='vim -O'

# Fancy ls
alias ls='ls --color -lhSAv --group-directories-first'

# Always attach to a current tmux session
alias tmux='tmux attach'

# Show the biggest files in this directory
alias dusize="sudo du -hs * | sort -hr | head -10"

# Watch a .tex file and compile it when you write to it
function pdflatex-watch() { while true; do inotifywait -e modify "$1"; pdflatex "$1"; done;}

# Listen to BBC Radio
function bbcradio() { local s PS3="Select a station: ";select s in 1 1x 2 3 4 5 6 7 "Asian Network an" "Nations & Local lcl";do break;done;s=($s);mplayer -playlist "http://www.bbc.co.uk/radio/listen/live/r"${s[@]: -1}".asx";}
function cvbbcradio() { local s PS3="Select a station: ";select s in 1 1x 2 3 4 5 6 7 "Asian Network an" "Nations & Local lcl";do break;done;s=($s);cvlc "http://www.bbc.co.uk/radio/listen/live/r"${s[@]: -1}".asx";}

# Convert a string to Mac Address format
function macaddr() { echo "$1" | sed -e 's/\([0-9A-Fa-f]\{2\}\)/\1:/g' -e 's/\(.*\):$/\1/' }

# Encrypt files with a shuffled hash symmetric passphrase
function gpg_encrypt() { gpg --symmetric --cipher-algo aes256 --digest-algo sha256 --cert-digest-algo sha256 --compress-algo none -z 0 --quiet --no-greeting --s2k-mode 3 --s2k-digest-algo sha512 "$@" }

# Get the weather
function weather() { curl "http://wttr.in/$1";}

# Automatically load environment variables specific to a directory tree
function chpwd() {
        if [ -r $PWD/.env ]; then
                source $PWD/.env
        fi
}

# Colors for man pages
man() {
  env \
    LESS_TERMCAP_md=$'\e[1;31m' \
    LESS_TERMCAP_us=$'\e[1;35m' \
    LESS_TERMCAP_so=$'\e[1;44;32m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    man "$@"
}

#eval "$(dircolors -b)"
eval "$(dircolors ~/.dircolors)"

# ZSH tab completion options
#
# Use a menu, color the output, etc.
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
# Hostnames completion.
# Pulls from .ssh/known_hosts (if not hashed) and .ssh/config
zstyle -e ':completion:*:hosts' hosts 'reply=(
${${${(@M)${(f)"$(<${HOME}/.ssh/config)"}:#Host *}#Host }:#*[*?]*}
)'
zstyle ':completion:*:*:*:hosts' ignored-patterns 'ip6*' 'localhost*'

# ZSH Settings for the Git RPROMPT
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

#vim_insert_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
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

# Add extra notification if this is a SSH session
if [[ -z "$SSH_CLIENT" ]]; then
        RPROMPT='${vcs_info_msg_0_}${vim_mode}%(?..%{$fg[red]%}[Error: %?]%{$reset_color%})%f'
else
        RPROMPT='%{$fg_bold[blue]%}[SSH]%{$reset_color%}${vcs_info_msg_0_}${vim_mode}%(?..%{$fg[red]%}[Error: %?]%{$reset_color%})%f'
fi

# Highlight brackets
# Requires zsh-syntax-highlighting package
# https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets)

# Print out sysinfo on shell start
archey3
