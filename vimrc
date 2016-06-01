" set nu
colorscheme desert
set ts=2
set sw=2
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    ""
set autoindent
set copyindent
set shiftround
set showmatch
set ignorecase
set smarttab
set hlsearch
set incsearch
set paste

let mapleader = ","
nmap <leader>ne :NERDTree<cr>

syntax on
filetype plugin indent on
" call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

" Reselect visual block after adjusting indentation
" vnoremap < <gv
" vnoremap > >gv

 " Nicer text navigation
" nmap j gj
" nmap k gk
" Strip trailing whitespace on save
  function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endfunction
autocmd! BufWritePre * :call <SID>StripTrailingWhitespaces()

" copy and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" execute "set <M-h>=^[h"
" execute "set <M-j>=^[j"
" #execute "set <M-k>=^[k"
" #execute "set <M-l>=^[l"

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
