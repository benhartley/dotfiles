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
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/opt/local/bin:/Users/btfh/.rvm/bin:/opt/local/bin:/usr/local/mysql/bin:~/.aws/api/bin/:~/.src/depot_tools/:~/bin:~/.cabal/bin:~/.bin

# use vim keybindings
set -o vi

# speed up mode transition
KEYTIMEOUT=1

# git stuff
alias gc='git commit'
alias ga='git add .'
alias gac='git add .; git commit'
alias gcb='git checkout -b'
alias gp='git push'
alias gl='git pull'
alias gst='git status'
alias ghub='git push github master'
alias gpull='git pull github master'

# convert timestamp to human readable
function timestamp() { perl -e "print scalar(localtime(${@})), \"\n\""; }

# set node path
export NODE_PATH="/usr/local/lib/node_modules"

# set AWS credentials path
export AWS_CREDENTIAL_FILE="/Users/btfh/.aws/cred.key"

# force local vim
#alias vim='/opt/local/bin/vim'
alias vim='/usr/local/bin/vim'
alias git='/usr/local/bin/git'

alias gulp='gulp --require coffee-script/register'

# force python 2.7.5 (homebrew)
alias python='/usr/local/bin/python'

# rumember
alias rtm='/Library/Ruby/Gems/2.0.0/gems/rumember-1.0.1/bin/ru'

alias gulp='gulp --require coffee-script/register'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# autojump
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

# from .bash_profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# tmux
function ta() { tmux attach-session -t ${@}; }

# tmux
function ta() { tmux attach-session -t ${@}; }

# set vim as editor
export EDITOR='/usr/local/bin/vim'

# Backward search in the shell history with <C-r>
bindkey '^r' history-incremental-search-backward
setopt hist_ignore_all_dups

# autocd
setopt autocd

# zmv
autoload zmv

# locale
LANG="en_GB.UTF-8"
LC_COLLATE="en_GB.UTF-8"
LC_CTYPE="en_GB.UTF-8"
LC_MESSAGES="en_GB.UTF-8"
LC_MONETARY="en_GB.UTF-8"
LC_NUMERIC="en_GB.UTF-8"
LC_TIME="en_GB.UTF-8"
LC_ALL=

# quicklook
function ql() { qlmanage -p ${@}; }

# Add arbitrary metadata to a file
# - example usage:
# 	- ls pattern | mdtag 'key:value'
function mdtag2() {
	# Split key:value pairs on comma
	pairs=(${(s/,/)1})
	file=$2
	# Loop through files (from stdin)
	while read file
	do
		# Loop through k:v pairs
		for pair in "${pairs[@]}"
		do
			# Split into key and value
			local key=$(echo $pair | tr ':' '\n' | sed -n 1p)
			local value=$(echo $pair | tr ':' '\n' | sed -n 2p)
			# Write metadata to file
			xattr -w com.apple.metadata:$key $value $file
		done
	done
}


[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
