#!/usr/bin/env sh
# set +e

function downloader {
command -v git >/dev/null 2>&1 || { echo >&2 "I require Git but it's not installed. Aborting..."; exit 1; }
}

function depends {
  for i in nvim nodejs; do
    if hash $i 2>/dev/null; then
      echo ""
      echo $i "is installed"
      echo ""
    else
      echo ""
      echo $i "is NOT installed. Please install it with your package manger"
      echo ""
    fi
  done    
}

function dotfile {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

clear
echo "Checking Dependencies..."
downloader
depends
sleep 1
echo ""
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
echo "Adding dotfile command to your .bashrc"
echo "alias dotfile='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
echo ""
echo "Downloading Vim-Plug for NeoVim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ""
sleep 1
echo "Downloading coc.nvim plugin"
mkdir -p ~/.local/share/nvim/site/pack/coc/start
cd ~/.local/share/nvim/site/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
echo ""
echo "Downloading Vim-Plug for NeoVim and Updating Plugins"
nvim --headless +PlugInstall +qall
echo ""
echo "You are now ready !"
