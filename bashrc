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
alias grm='git rm $(git ls-files --deleted)'

# set tab name in iTerm
function tabname() { echo -ne "\033]0;${@}\007";}
