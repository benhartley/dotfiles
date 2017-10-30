ZSH=$HOME/.oh-my-zsh
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="btfh"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump pass history-substring-search)

source $ZSH/oh-my-zsh.sh

# Go
export GOPATH=~/work/go

# Customize to your needs...
export PATH=~/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH="$PATH:$GOPATH/bin"

# use vim keybindings
set -o vi

# speed up mode transition
KEYTIMEOUT=1

# git stuff
alias gc='git commit --verbose'
alias ga='git add .'
alias gac='git add --all; git commit --verbose'
alias gac@='gac --fixup=@'
alias gcb='git checkout -b'
alias gp='git push'
alias gl='git pull --prune'
alias gst='git status'
alias grm='git rebase master'
alias gdms='git diff master --stat'
alias hpr='hub pull-request'
alias gsqm='git rebase -i --autosquash master'
gsq() {
    git rebase -i --autosquash "$1"
}
lst() {
    ls -t "$1" | head -n 10
}

# yarn
alias yr='yarn run'
alias ya='yarn add'
alias yrm='yarn remove'
alias yt='yarn run test'
alias ytw='yarn run test -- --watch'

alias f='feh --hide-pointer --info "echo "%F"; tmsu tags %F | cut -d: -f2" --action1 ";t %F <(read -e -p \"Enter tag string:\")" --draw-tinted' 
ft() {
    tmsu files -f $(read) > /tmp/fehlist
    f -f /tmp/fehlist
}

# GPG
GPG_TTY=$(tty)
export GPG_TTY

# autojump
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

# tmux
function ta() { tmux attach-session -t ${@}; }

# vars
export EDITOR='/usr/bin/vim'

# Backward search in the shell history with <C-r>
bindkey '^r' history-incremental-search-backward
setopt hist_ignore_all_dups
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# autocd
setopt autocd

# zmv
autoload zmv

# edit-command
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# locale
LANG="en_GB.UTF-8"
LC_COLLATE="en_GB.UTF-8"
LC_CTYPE="en_GB.UTF-8"
LC_MESSAGES="en_GB.UTF-8"
LC_MONETARY="en_GB.UTF-8"
LC_NUMERIC="en_GB.UTF-8"
LC_TIME="en_GB.UTF-8"
LC_ALL=

source <(kops completion zsh)
source <(kubectl completion zsh)
source /usr/bin/aws_zsh_completer.sh

# Setting ag as the default source for fzf - include hidden files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--exact'
# # To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
command -v blsd > /dev/null && export FZF_ALT_C_COMMAND='blsd'
command -v tree > /dev/null && export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -$LINES'"

_fzf_complete_pass() {
    _fzf_complete '+m' "$@" < <(
      local pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
      local stringsize="${#pwdir}"
      find "$pwdir" -name "*.gpg" -print |
      cut -c "$((stringsize + 1))"-  |
      sed -e 's/\(.*\)\.gpg/\1/'
    )
}

_fzf_complete_ledger() {
    _fzf_complete '+m' "$@" < <(ledger accounts)
}

_fzf_complete_ledger_post() {
    awk '{printf("\"%s\"\n", $0);}'
}

_fzf_complete_t() {
    _fzf_complete "" "$@" < <(tmsu tags)
}

tagstart() {
    unset HISTFILE
    cd /mnt/samsung850pro
    source zshrc
}

alias -g s=systemctl 

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

