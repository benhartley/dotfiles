# install stuff
yum install git zsh tmux

# use zsh
chsh -s /bin/zsh

# install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# get dotfiles
cd; git clone git://github.com/benhartley/dotfiles.git .dotfiles

# create symlinks for dotfiles
cd ~
rm .zshrc; ln -s .dotfiles/zshrc .zshrc
rm .vimrc; ln -s .dotfiles/vimrc .vimrc
rm -drf .vim; ln -s .dotfiles/vim .vim
rm .tmux.conf; ln -s .dotfiles/tmux.conf .tmux.conf
ln -s .dotfiles/btfh.zsh-theme ~/.oh-my-zsh/themes/btfh.zsh-theme

