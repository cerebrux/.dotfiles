# .dotfiles For Server

Git Bare repository with my dotfiles for :

* Vim
* Tmux

Also the installer will download and configure:

* Oh my Tmux config
* SlimZsh 

## How to download

### Step 0: SSH to Server using Kitty terminal

if you use **kitty** terminal (as I do) first ssh in using the following command which will automatically copy the terminfo files to the server
```
kitty +kitten ssh myserver
```
otherwise when at the end you launch tmux, it will faill with: `open terminal failed: missing or unsuitable terminal: xterm-kitty`
source: [I get errors about the terminal being unknown or opening the terminal failing when SSHing into a different computer?](https://sw.kovidgoyal.net/kitty/faq.html#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-when-sshing-into-a-different-computer)

### Step 1: Dependencies 

First install the following dependencies:

* Nerd Fonts Fira Code : We need Ligatures for icons and symbols
* git : This is for downloading the repository
* tmux : Because why use regular shell session when you can tmux ?
* zsh : Bash is for Boomers
* shellcheck : Is used by Neomake plugin to check your shell scripts
* Jump : It learns from you by keeping track of the directories you visit.

For Ubunut/Debian and officially supported derivatives you can install the dependencies by running:

```
sudo apt install fonts-firacode curl git tmux zsh shellcheck
wget https://github.com/gsamokovarov/jump/releases/download/v0.30.1/jump_0.30.1_amd64.deb && sudo apt install ./jump_0.30.1_amd64.deb
chsh -s /bin/zsh 
```
Now logout from your server session and login back so that the paths for shell and golang to be properly registered for your user account

### Step 2: Run the installer

Then download the script and run it:
```
wget -O clone-dotfiles.sh https://raw.githubusercontent.com/cerebrux/.dotfiles/server/.clone-dotfiles.sh

sh clone-dotfiles.sh
```

The script will create te environment, backup your old dotfiles and then clone this repo.

### Step 3: Test the environment

The script should automatically run vim to start installing the plugins and then exit. 
Once it's done, run Vim and then ":checkhealth" command in vim to make sure that it's properly setup

Vim: Plungins that are enabled 
---

1 - vim-nerdtree-syntax-highlight:syntax for nerdtree on most common file extensions
2 - vim-devicons: Adds filetype glyphs (icons) to various vim plugins.        
3 - nerdcommenter: Comment functions so powerful—no comment necessary.       
4 - vim-gitgutter: It shows which lines have been added, modified, or removed       
5 - gruvbox: The best looking theme. Period.        
6 - nerdtree: The defacto File manager       
7 - ctrlp.vim: fuzzy find files        
8 - nerdtree-git-plugin: NERDTree showing git status flags          
9 - vim-airline: Lean & mean status/tabline for vim that's light as air.       
10 - vim-fugitive: Fugitive is the premier Vim plugin for Git. it's so awesome, it should be illegal.       
11 - neomake : Runs ShellCheck       


