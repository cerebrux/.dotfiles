# .dotfiles

Git Bare repository with my dotfiles for :

* NeoVim
* Alacritty and Kitty terminals

Also the installer will download and configure:

* Oh my Tmux config
* SlimZsh 

## How to download

### Step 1: Dependencies 

First install the following dependencies:

* Fira Code fonts : We need Ligatures for icons and symbols
* NeoVim : Because that is what I use
* git : This is for downliading the repository
* nodejs : Is used by the CoC Plugin
* npm : Is used by the CoC Plugin
* tmux : Because why use regular shell session when you can tmux ?
* zsh : Bash is for Boomers
* shellcheck : Is used by Neomake plugin to check your shell scripts

For Ubunut/Debian and derivatives you can install the dependencies by running:

```
sudo apt install fonts-firacode git nodejs npm tmux zsh shellcheck
sudo apt install snapd
sudo snap install nvim --beta --classic
```

### Step 2: Run the installer

Then run the following:
```
wget -O - https://raw.githubusercontent.com/cerebrux/.dotfiles/master/.clone-dotfiles.sh | bash
```

The script will create te environment, backup your old dotfiles and then clone this repo.

### Step 3: Test the environment

Now run nvim and check if coc.nvim starts updating the plugins. 
Once it's done, run ":checkhealth" command in neovim to make sure that it's properly setup

NeoVim: Plungins that are enabled 
---

1 - vim-nerdtree-syntax-highlight:syntax for nerdtree on most common file extensions
2 - vim-devicons: Adds filetype glyphs (icons) to various vim plugins.        
3 - nerdcommenter: Comment functions so powerful—no comment necessary.       
4 - vim-gitgutter: It shows which lines have been added, modified, or removed       
5 - gruvbox: The best looking theme. Period.        
6 - nerdtree: The defacto File manager       
7 - ctrlp.vim: fuzzy find files        
8 - nerdtree-git-plugin: NERDTree showing git status flags       
9 - coc.nvim: Coc is an intellisense engine       
10 - vim-airline: Lean & mean status/tabline for vim that's light as air.       
11 - vim-fugitive: Fugitive is the premier Vim plugin for Git. it's so awesome, it should be illegal.       
12 - neomake : Runs ShellCheck       


