# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="btfh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git, autojump, cake)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/btfh/.rvm/gems/ruby-1.9.2-p318/bin:/Users/btfh/.rvm/gems/ruby-1.9.2-p318@global/bin:/Users/btfh/.rvm/rubies/ruby-1.9.2-p318/bin:/Users/btfh/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/opt/local/bin:/Users/btfh/.rvm/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/usr/local/mysql/bin:~/.aws/api/bin/:~/.src/depot_tools/:~/bin

# use vim keybindings
set -o vi

# git stuff
alias gc='git commit -m'
alias ga='git add .'
alias gcb='git checkout -b'
alias gp='git push'
alias gl='git pull'
alias gst='git status'
alias ghub='git push github master'
alias gpull='git pull github master'
alias grm='git rm $(git ls-files --deleted)'

# set tab name in iTerm
function tabname() { echo -ne "\033]0;${@}\007"; }

# convert timestamp to human readable
function timestamp() { perl -e "print scalar(localtime(${@})), \"\n\""; }

# recursive grep in current dir
function gr() { grep -nr "${@}" *; }

# set node path
export NODE_PATH="/usr/local/lib/node_modules"

# set AWS credentials path
export AWS_CREDENTIAL_FILE="~/.aws/cred.key"

# force local vim
alias vim='/opt/local/bin/vim'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# autojump
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

# from .bash_profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
function ms() { mux s ${@}; }

# set vim as editor
export EDITOR='/opt/local/bin/vim'

# Backward search in the shell history with <C-r>
bindkey '^r' history-incremental-search-backward
setopt hist_ignore_all_dups

# autocd
setopt autocd

# zmv
autoload zmv
