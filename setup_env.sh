ln -s ~/personal/vim/vimrc ~/.vimrc
ln -s ~/personal/vim/vim ~/.vim

#Create the lxde-rc.xml symbolic link for windows shortcuts
mv ~/.config/openbox/lxde-rc.xml ~/.config/openbox/lxde-rc.xml.original
ln -s ~/personal/vim/lxde-rc.xml ~/.config/openbox/lxde-rc.xml
openbox --reconfigure

# Configure the xfce terminal
mv ~/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc.original
ln -s ~/personal/vim/terminalrc ~/.config/xfce4/terminal/terminalrc
