"set encoding=UTF-8 <-- Only for Vim not Nvim as UTF-8 is default
"Plungins that are enabled :                                  
"1 - vim-nerdtree-syntax-highlight:syntax for nerdtree on most common file extensions
"2 - vim-devicons: Adds filetype glyphs (icons) to various vim plugins. 
"3 - nerdcommenter: Comment functions so powerful—no comment necessary.
"4 - vim-gitgutter: It shows which lines have been added, modified, or removed
"5 - gruvbox: The best looking theme. Period. 
"6 - nerdtree: The defacto File manager
"7 - ctrlp.vim: fuzzy find files 
"8 - nerdtree-git-plugin: NERDTree showing git status flags
"9 - vim-airline: Lean & mean status/tabline for vim that's light as air.
"10 - vim-fugitive: Fugitive is the premier Vim plugin for Git. it's so awesome, it should be illegal.
"11 - neomake : Runs ShellCheck
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
"Install  https://aur.archlinux.org/packages/nerd-fonts-fira-code/
" the following probably is not needed
"set guifont=Fira\ Code\ 11
"----NERDTree File Manager Plugins with Git status support----
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
"-------------------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
"Plug 'benmills/vimux'
" Initialize plugin system
call plug#end()
set termguicolors "Neovim and recent Vim support true color terminal out of the box with just a single configuration option. No workarounds anymore. Just add set termguicolors "
colorscheme gruvbox
" Add mouse resize with drag
if has('mouse')
  set mouse=a
endif
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

" Required:
filetype plugin indent on
"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

let no_buffers_menu=1

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif


"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e
" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif



"Pressing both 'jk' will invoke ESC key: "
inoremap jk <ESC> 
" default updatetime 4000ms is not good for async update

"====== Neomake ShellCheck Logfile ======
let g:neomake_logfile = '/tmp/neomake.log'
"====== Neomake ShellCheck Logfile ======
" default updatetime 4000ms is not good for async update
set updatetime=100
call neomake#configure#automake('rw', 1000)

"===NERDTree======
"Keyboard Commands
"Type :help NERDTreeMappings to read through all of the default keyboard shortcuts. These are the ones I use the most frequently:
"t: Open the selected file in a new tab
"i: Open the selected file in a horizontal split window
"s: Open the selected file in a vertical split window
"I: Toggle hidden files
"m: Show the NERD Tree menu
"R: Refresh the tree, useful if files change outside of Vim
"?: Toggle NERD Tree's quick help


"Press Ctrl+n to open Side Pane file manager
"Press Q to close a pane"
nmap <C-n> :NERDTreeToggle<CR>

"open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",  
    \ "Modified"  : "#d9bf91",  
    \ "Renamed"   : "#51C9FC",  
    \ "Untracked" : "#FCE77C",  
    \ "Unmerged"  : "#FC51E6",  
    \ "Dirty"     : "#FFBD61",  
    \ "Clean"     : "#87939A",   
    \ "Ignored"   : "#808080"   
    \ }                         


let g:NERDTreeIgnore = ['^node_modules$']

"Mitigating lag issues wiht tiagofumo/vim-nerdtree-syntax-highlight
"Some users are reporting they feel some lag when using this plugin. 
"There are ways to mitigate this lag. One way is to disable most of the the default highlight exntensions. 
"The code is going to color over than 80 extensions by default,
"even if you are not using most of them. One easy way to do this is using the limited syntax mode:

"This configuration will limit the extensions used to these:

".bmp, .c, .coffee, .cpp, .css, .erb, .go, .hs, .html, .java, .jpg, .js, .json, .jsx, .less, .lua, .markdown, .md, .php, .png, .pl, .py, .rb, .rs, .scala, .scss, .sh, .sql, .vim

let g:NERDTreeLimitedSyntax = 1
"If this doens't solve your lag, or doesn't include the extensions you normaly use,
"you can choose the extensions you want to enable. 
"For example, if you work with C, php, ruby and javascript, 
"you could add something like this to your .vimrc instead:

"let g:NERDTreeSyntaxDisableDefaultExtensions = 1
"let g:NERDTreeDisableExactMatchHighlight = 1
"let g:NERDTreeDisablePatternMatchHighlight = 1
"let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'c++', 'php', 'rb', 'js', 'css'] " example

" sync open file with NERDTree
autocmd BufEnter * lcd %:p:h

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

"How can I close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"===NERDTree======
"
"=== NERDCommenter ====
" You can highlight multiple lines and then press ++ to comment them out
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
"=== ==== ====

"==== vim-prettier ======
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
"" prettier command for coc
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.go,*.sh PrettierAsync
""==== vim-prettier ======

"Airline Powerline Fonts support :
let g:airline_powerline_fonts = 1


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

set number relativenumber
set nu rnu

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
