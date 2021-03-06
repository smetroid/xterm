# Create vim and vimrc symbolic links
ln -s ~/personal/system/vimrc ~/.vimrc
ln -s ~/personal/system/vim ~/.vim

# Create .bashrc link
ln -s ~/personal/system/bashrc ~/.bashrc

# Create the lxde-rc.xml symbolic link for windows shortcuts
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
#ln -s ~/personal/system/vim/bundle/conque-term/autoload/ ~/personal/system/vim/bundle/Conque-Shell/autoload/

# Add ssh configs
ln -s ~/personal/system/ssh/config ~/.ssh/config

# Add byobu keybindings
ln -s ~/personal/system/keybindings.tmux ~/.byobu/keybindings.tmux

# Straight up tmux config
ln -s ~/personal/system/tmux.conf ~/.tmux.conf
