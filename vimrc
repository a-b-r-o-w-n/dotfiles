""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
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
set complete=.,w,t
set splitbelow
set splitright
set hlsearch
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
autocmd Filetype java setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load bundles
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
let g:rehash256=1
colorscheme molokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Map capital letters to their lowercase
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Inserts the path of the currently edited file into a command
" Command mode: %%
cmap %% <C-R>=expand("%:p:h") . "/" <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent undo
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

set noerrorbells
set visualbell

" Load scripts
if filereadable($HOME . "/.vimrc.scripts")
  source ~/.vimrc.scripts
endif

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
