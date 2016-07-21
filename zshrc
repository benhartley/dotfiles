# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
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

# Customize to your needs...
export PATH=~/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/opt/local/bin:/opt/local/bin:/usr/local/mysql/bin:~/.aws/api/bin/:~/.src/depot_tools/:~/bin:~/.cabal/bin:~/.bin

# use vim keybindings
set -o vi

# speed up mode transition
KEYTIMEOUT=1

# git stuff
alias gc='git commit'
alias ga='git add .'
alias gac='git add --all; git commit'
alias gcb='git checkout -b'
alias gp='git push'
alias gl='git pull --prune'
alias gst='git status'
alias ghub='git push github master'
alias gpull='git pull github master'
alias grm='git rebase master'
alias hpr='hub pull-request'

# convert timestamp to human readable
function timestamp() { perl -e "print scalar(localtime(${@})), \"\n\""; }

# force local vim
alias ccat='pygmentize -g'

# autojump
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

# tmux
function ta() { tmux attach-session -t ${@}; }

# vars
export EDITOR='/usr/bin/vim'
export ANDROID_HOME=/opt/android-sdk

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

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

# Setting ag as the default source for fzf - include hidden files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# # To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Git history in FZF
gfzf() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# Chromium history in FZF
cfzf() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'
  cp -f ~/.config/chromium/Default/History /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs xdg-open
}

tagstart() {
    unset HISTFILE
    cd /mnt/samsung850pro/.p
    source zshrc
}

alias -g s=systemctl 

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

eval "$(rbenv init -)"

