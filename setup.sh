# add new user
sudo useradd -m -G admin -s /bin/zsh ben
sudo visudo

# install stuff
yum install git zsh tmux

# use zsh - don't need to do this as already done in useradd...
chsh -s /bin/zsh

# install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
# need to install autojump here...

# get dotfiles
cd; git clone git://github.com/benhartley/dotfiles.git .dotfiles

# create symlinks for dotfiles
cd ~
rm .zshrc; ln -s .dotfiles/zshrc .zshrc
rm .vimrc; ln -s .dotfiles/vimrc .vimrc
rm -drf .vim; ln -s .dotfiles/vim .vim
rm .tmux.conf; ln -s .dotfiles/tmux.conf .tmux.conf
cp .dotfiles/btfh.zsh-theme .oh-my-zsh/themes/

# vim 7.3 on amazon ami
sudo yum install ncurses-devel
cd; curl -o vim.tar.bz2 ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar -jxf vim.tar.bz2
cd vim/src
make

