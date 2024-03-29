filetype off
call plug#begin('~/.config/nvim/bundle')

Plug 'tomasr/molokai'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'sass'] }
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-eunuch'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {'dir': 'node_modules'}
if executable('ag')
  let g:ag_prg = 'ag --nogroup --column --nocolor'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let NERDTreeWinPos='right'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'benekastah/neomake'

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_json_enabled_makers = ['jsonlint']

autocmd! BufWinEnter,BufWritePost * Neomake

function! LocationNext()
  try
    lnext
  catch
    lfirst | catch | endtry
  endtry
endfunction

nnoremap <Leader>n :silent! call LocationNext()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'itchyny/lightline.vim'
set noshowmode
let g:lightline = {}
let g:lightline.active = {}
let g:lightline.active.left = [ [ 'mode', 'paste' ], [ 'filename' ] ]
let g:lightline.active.right = [ [ 'lineinfo' ], [ 'filetype' ] ]
let g:lightline.component_function = { 'readonly': 'MyReadonly', 'modified': 'MyModified', 'filename': 'MyFilename' }
let g:lightline.component_visible_condition = { 'readonly': '(&filetype!="help"&& &readonly)', 'modified': '(&filetype!="help"&&(&modified||!&modifiable))' }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

" TODO why does fugitive in status line break neovim
function! MyFugitive()
  return exists('*fugitive#head') ? '⭠ ' . fugitive#head() : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Ag for file searching, including Ctrl+p
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'rking/ag.vim'

map <leader>a :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'

map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>ga :Git add --all<cr>:Gcommit<cr>
map <leader>gb :Gblame<cr>
map <leader>ph :Gpush origin head<cr>

" Use j/k in status
function! BufReadIndex()
  setlocal cursorline
  setlocal nohlsearch

  nnoremap <buffer> <silent> j :call search('^#\t.*','W')<Bar>.<CR>
  nnoremap <buffer> <silent> k :call search('^#\t.*','Wbe')<Bar>.<CR>
endfunction

autocmd BufReadCmd *.git/index exe BufReadIndex()
autocmd BufEnter   *.git/index silent normal gg0j

" Start in insert mode for commit
function! BufEnterCommit()
  normal gg0
  if getline('.') == ''
    start
  end
endfunction
autocmd BufEnter    *.git/COMMIT_EDITMSG             exe BufEnterCommit()

" Automatically remove fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'Valloric/YouCompleteMe'
" set completeopt-=preview

call plug#end()
filetype on
