""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set tabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:»·,trail:·
set number
set numberwidth=5
set cursorline
set wildmode=list:longest,list:full
set complete=.,w,t,b
set splitbelow
set splitright
set hlsearch
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load bundles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.nvimrc.bundles

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
let g:rehash256 = 1

try
  colorscheme molokai
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch between the last two files
nmap <leader><leader> <c-^>
nmap <leader>w :w<CR>
nmap <leader>o :CtrlP<CR>

" Copy/paste from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Map capital letters to their lowercase
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Open split with term
nnoremap <C-w><C-v> <C-w>v :term<CR>
nnoremap <C-w><C-s> <C-w>s :term<CR>

" Inserts the path of the currently edited file into a command
" Command mode: %%
cmap %% <C-R>=expand("%:p:h") . "/" <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=$HOME/.nvim/undo

set undolevels=1000
set undoreload=10000

set noerrorbells
set visualbell

autocmd Filetype java setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.jsx set filetype=javascript syntax=javascript.jsx

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load scripts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.nvimrc.scripts
