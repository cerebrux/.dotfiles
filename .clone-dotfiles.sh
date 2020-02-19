#!/usr/bin/env sh
set +e

function dotfile {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

clear
echo "Downloading .dotfiles"
sleep 1
git clone --bare https://github.com/cerebrux/.dotfiles.git $HOME/.dotfiles
echo ""
echo ""
sleep 1
echo "Checking if backup is neccesary for your .dotfiles"
mkdir -p ~/.config-backup
dotfile checkout
if [ $? = 0 ]; then
  echo "Download complete";
  else
    echo "Creating backup of your .dotfiles";
    dotfile checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    echo "Your previous .dotfiles are backed up at .config-backup folder"
fi;
sleep 1
dotfile checkout
dotfile config status.showUntrackedFiles no
echo ""
echo "Downloading Vim-Plug for NeoVim and Updating Plugins"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
echo "You are now ready !"
