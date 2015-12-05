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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Autojump
[[ -s ~/.autojump/etc/profile.d/autojump.bash ]] && source ~/.autojump/etc/profile.d/autojump.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
