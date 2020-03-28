#!/bin/bash
# set +e
DOTFILES_PATH="${HOME}/.dotfiles"

depends() {
  for i in zsh jump nodejs shellcheck; do
    if hash $i 2>/dev/null; then
      echo ""
      echo $i "is installed"
    else
      echo $i "is NOT installed. Please install it with your package manger"
      echo ""
    fi
  done    
}

dotfile() {
   git --git-dir="${DOTFILES_PATH}" --work-tree="${HOME}" "$@"
}

clear
echo "Checking if .dotfiles already exist"
sleep 1
echo ""
if [[ -d ${DOTFILES_PATH} ]]; then
    echo ">>> ERROR: ${DOTFILES_PATH} already exists"
    sleep 1
    exit 1
fi

echo "Checking Dependencies..."
command -v git >/dev/null 2>&1 || { echo >&2 "I require Git but it's not installed. Aborting..."; exit 1; }
command -v nvim >/dev/null 2>&1 || { echo >&2 "I require NeoVim but it's not installed. Aborting..."; exit 1; }
command -v curl >/dev/null 2>&1 || { echo >&2 "I require Curl but it's not installed. Aborting..."; exit 1; }
depends
sleep 1
echo ""
echo "Downloading .dotfiles"
sleep 1
git clone --bare https://github.com/cerebrux/.dotfiles.git "${DOTFILES_PATH}"
echo ""
echo ""
sleep 1
echo "Checking if backup is neccesary for your .dotfiles"
if [[ ! "$(dotfile checkout 2>/dev/null)" ]]; then
  echo ""
  echo ">>> NOTICE: Backing up existing files"
  BACKUP_DIR="${HOME}/.dotfiles-backup/$(date +'%F_%T')"
  FILES="$(dotfile checkout 2>&1 | grep -E '^\s+(.*)$' | awk {'print $1'})"
  for FILE in ${FILES}; do
      mkdir --parents "$(dirname "${BACKUP_DIR}/${FILE}")" && mv "${HOME}/${FILE}" "$_"
  done
  dotfile checkout 2>/dev/null
fi
sleep 1

dotfile config status.showUntrackedFiles no
dotfile remote set-url origin git@github.com:cerebrux/.dotfiles.git
echo ""
echo "Adding dotfile command to .bashrc and .zshrc"
(echo "" ; echo "alias dotfile='git --git-dir=${DOTFILES_PATH} --work-tree=$HOME'") >> "$HOME/.bashrc"
(echo "" ; echo "alias dotfile='git --git-dir=${DOTFILES_PATH} --work-tree=$HOME'") >> "$HOME/.zshrc"
sleep 1
echo ""
echo "Downloading Vim-Plug for NeoVim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ""
sleep 1
echo "Downloading coc.nvim plugin"
mkdir -p ~/.local/share/nvim/site/pack/coc/start
cd ~/.local/share/nvim/site/pack/coc/start || exit
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
echo ""
echo "Downloading Vim-Plug for NeoVim and Updating Plugins"
sleep 1
echo ""
nvim --headless +PlugInstall +qall
mkdir ~/.vim/colors/
ln -s ~/.vim/plugged/gruvbox/colors/gruvbox.vim ~/.vim/colors/gruvbox.vim
sleep 1
echo ""
echo "Downloading Tmux Configs and Slimzsh"
cd || exit
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf .
cp .tmux/.tmux.conf.local .
echo ""
echo "Downloading Slimzsh"
sleep 1
git clone --recursive https://github.com/changs/slimzsh.git ~/.slimzsh
echo ""
echo "Adding slimzsh command to .zshrc"
(echo "" ; echo "source '$HOME/.slimzsh/slim.zsh'") >> "$HOME/.zshrc"
sleep 1
echo "Adding Jump to your .bashrc and .zshrc"
(echo "" ; echo "eval '$(jump shell)'") >> "$HOME/.zshrc"
(echo "" ; echo "eval '$(jump shell)'") >> "$HOME/.bashrc"
sleep 1
echo ""
echo "You are now ready !... Please reload/restart your shell"
