echo "Downloading .dotfiles"
git clone --bare https://github.com/cerebrux/.dotfiles.git $HOME/.dotfiles
function dotfile {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
echo ""
echo ""
echo "Checking if backup is neccesary for your .dotfiles"
mkdir -p .config-backup
dotfile checkout
if [ $? = 0 ]; then
  echo "Download complete";
  else
    echo "Creating backup of your .dotfiles";
    dotfile checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    echo "Your previous .dotfiles are backed up at .config-backup folder"
fi;
dotfile checkout
dotfile config status.showUntrackedFiles no
echo "You are now ready !"