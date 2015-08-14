# Install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Taps
brew tap homebrew/science
brew tap phinze/cask
brew tap caskroom/versions

# Install stuff
brew install brew-cask
brew install ack
brew install pass
brew install gpg2
brew install jq
brew install pup
brew install tmux
brew install reattach-to-user-namespace
brew install vim
brew install tig
brew install ledger
brew install gawk
brew install gnu-sed
brew install r
brew install mysql
brew install elasticsearch
brew install logstash
brew install htop
brew install mutt
brew install urlview
brew install w3m
brew install notmuch
brew install offlineimap # note - need to follow installation instructions
brew install ghi # note - need to `sudo gem install pygments.rb` also for code blocks
brew install git
brew install redis
brew install hub
brew install imagemagick
brew install irssi
brew install docker
brew install docker-machine
brew install docker-compose
brew install leiningen

# Casks
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install slack
brew cask install firefox
brew cask install flux
brew cask install keepingyouawake
brew cask install alfred
brew cask install quicksilver
brew cask install nocturne
brew cask install audacity
brew cask install fluid
brew cask install gimp
brew cask install iterm2
brew cask install vlc
brew cask install xee22
brew cask install virtualbox # requires password
brew cask install little-snitch # note - need to follow installation instructions
brew cask install karabiner
brew cask install asepsis
brew cask install transmission
brew cask install mattr-slate

# Link to alfred
brew cask alfred link

# Tidy up
brew cask cleanup

# should also create a gemfile
# - explain_shell
# - rtm (name?)
# - reckon

