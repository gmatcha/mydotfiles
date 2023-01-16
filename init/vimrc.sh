sudo rm -r ~/.vim 2> /dev/null
sudo rm -r ~/.vimrc 2> /dev/null
ln -sf ~/.files ~/.vim
ln -sf ~/.files/vimrc ~/.vimrc
ln -sf ~/.files/tmux.conf ~/.tmux.conf
sudo update-alternatives --set vim /usr/bin/vim.gtk3
##sudo update-alternatives --set vim /usr/bin/vim.gnome-py2
rm -rf ~/.config/tilda
ln -sf ~/.files/tilda ~/.config/tilda


