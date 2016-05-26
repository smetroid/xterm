ln -s ~/personal/system/vimrc ~/.vimrc
ln -s ~/personal/system/vim ~/.vim

#Create the lxde-rc.xml symbolic link for windows shortcuts
mv ~/.config/openbox/lxde-rc.xml ~/.config/openbox/lxde-rc.xml.original
ln -s ~/personal/system/X/lxde-rc.xml ~/.config/openbox/lxde-rc.xml
openbox --reconfigure

# Configure the xfce terminal
mv ~/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc.original
ln -s ~/personal/system/X/terminalrc ~/.config/xfce4/terminal/terminalrc

# Configure the parcellite
mv ~/.config/parcellite/parcelliterc ~/.config/parcellite/parcelliterc.original
ln -s ~/personal/system/X/parcelliterc ~/.config/parcellite/parcelliterc

# Fix the Conque-Shell vim plugin
ln -s ~/personal/system/vim/bundle/conque-term/autoload/ ~/personal/system/vim/bundle/Conque-Shell/autoload/
