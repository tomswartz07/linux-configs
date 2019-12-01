# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
# History
setopt append_history
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt inc_append_history_time
setopt share_history
# Completion
setopt always_to_end
setopt autocd
unsetopt beep
setopt complete_aliases
setopt complete_in_word
setopt correct
setopt interactivecomments
setopt list_ambiguous
# Job Control
setopt auto_continue

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
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu

# Export Env Variables
REPORTTIME=5
PATH="/opt/android-sdk/platform-tools:${PATH}"
if which ruby >/dev/null 2>&1 ; then
        PATH=$(ruby -e "puts Gem.user_dir")/bin:${PATH}
        RUBY_PATH="$(ruby -e "puts Gem.user_dir")/bin"
        GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
        export PATH
        export RUBY_PATH
fi
export EDITOR=/usr/bin/vim
export TERM=rxvt-unicode-256color
export GPG_TTY=$(tty)
#export LESS='-C -M -I -j 10 -# 4'
if which spruce >/dev/null 2>&1 ; then
        SPRUCE_PATH="/usr/local/bin"
        export SPRUCE_PATH
fi
if [[ -d "$HOME/.go" ]]; then
        GOPATH="/home/tom/.go/"
        export GOPATH
fi

# Keybindings
bindkey -v
bindkey '^r' history-incremental-pattern-search-backward # CTRL+R
bindkey '^p' history-incremental-pattern-search-forward  # CTRL+P
bindkey '^x' history-beginning-search-menu
bindkey '^[.' insert-last-word    # ESC+.
bindkey '^[[1~' beginning-of-line # HOME
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line       # END
bindkey '^[[3~' delete-char       # DEL
bindkey '^B' backward-word        # CTRL+B
bindkey '^F' forward-word         # CTRL+F

#[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

# Aliases and functions

# Auto-Sudo for package manager
alias pacman='sudo pacman'
#alias packer='yay'

# Automatically make it a private Gist and copy Gist URL
# Requires https://github.com/defunkt/gist
alias gist='gist -c -p'

# Add the -O flag to open files in vsplits with Vim
alias vim='vim -O'

# Fancy ls
alias ls='ls --color -lhSAv --group-directories-first'

# Always attach to a current tmux session
#alias tmux='tmux attach'

# Show the biggest files in this directory
alias dusize="sudo du -hs ** | sort -hr | head -10"

# Aliases and exports for Bosh, because it sucks
alias bosh="/usr/bin/bosh"
if [[ -e "$HOME/git/bosh-deployment/deployments/vbox/state.json" ]]; then
        export BOSH_CLIENT=admin
        export BOSH_ENVIRONMENT=vbox
        export BOSH_CLIENT_SECRET=$(bosh int ~/git/bosh-deployment/deployments/vbox/creds.yml --path /admin_password)
        export BOSH_CA_CERT=$(bosh int ~/git/bosh-deployment/deployments/vbox/creds.yml --path /director_ssl/ca)
        export CF_STEMCELL_VERSION=$(bosh int ~/git/cf-deployment/cf-deployment.yml --path /stemcells/alias=default/version)
        export CREDHUB_CLIENT=credhub-admin
        export CREDHUB_SERVER=https://192.168.50.6:8844/
        export CREDHUB_SECRET=$(bosh int ~/git/bosh-deployment/deployments/vbox/creds.yml --path /credhub_admin_client_secret)
        export CREDHUB_CA_CERT="$(bosh int ~/git/bosh-deployment/deployments/vbox/creds.yml --path /credhub_tls/ca)\n$(bosh int ~/git/bosh-deployment/deployments/vbox/creds.yml --path /uaa_ssl/ca)"
        alias bosh_save="vboxmanage controlvm $(bosh int ~/git/bosh-deployment/deployments/vbox/state.json --path /current_vm_cid) savestate"
        alias bosh_up="vboxmanage startvm $(bosh int ~/git/bosh-deployment/deployments/vbox/state.json --path /current_vm_cid) --type headless"
fi

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
function weather() { curl "https://wttr.in/$1";}

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
if [ -d /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets)
elif [ -d /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets)
fi

# K8s completion
if which kubectl >/dev/null 2>&1 ; then
        source <(kubectl completion zsh)
fi

# Print out sysinfo on shell start
if which archey3 >/dev/null 2>&1 ; then
        archey3 --config ~/.config/archey3.cfg
fi
