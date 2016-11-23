set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
"git clone https://github.com/roman/golden-ratio
"#git clone https://github.com/zhaocai/GoldenView.Vim
"git clone https://github.com/jistr/vim-nerdtree-tabs
"git clone https://github.com/vim-scripts/SearchComplete
" Plugin 'ervandew/supertab'
"git clone https://github.com/majutsushi/tagbar
"git clone https://github.com/vim-scripts/taglist.vim
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'Casecommons/vim-rails'
Plugin 'vim-ruby/vim-ruby'
"#git clone https://github.com/Valloric/YouCompleteMe
Plugin 'regedarek/ZoomWin'
Plugin 'scrooloose/nerdtree'
"git clone https://github.com/dkprice/vim-easygrep
Plugin 'mustache/vim-mustache-handlebars'
"#git clone https://github.com/shougo/vimshell.vim
"#git clone https://github.com/shougo/vimproc.vim
"#git clone https://github.com/vim-scripts/Conque-Shell
"#git clone https://github.com/rosenfeld/conque-term
"git clone https://github.com/sourcegraph/sourcegraph-vim.git
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'ajh17/VimCompletesMe'
Plugin 'roxma/SimpleAutoComplPop'
Plugin 'nathanielc/vim-tickscript'


" Language specific
Plugin 'fatih/vim-go'
Plugin 'klen/python-mode'
Plugin 'Blackrush/vim-gocode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" set nu
set ts=2
set sw=2
set expandtab     " tabs into spaces
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
"set paste      " Causes supertab to misbehave

" Solarized colorscheme things
let g:solarized_termcolors=256
syntax enable
colorscheme solarized
set background=dark


let python_highlight_all = 1

let mapleader = ","
nmap <leader>ne :NERDTree<cr>

filetype plugin indent on
" Reselect visual block after adjusting indentation
" vnoremap < <gv
" vnoremap > >gv

" Nicer text navigation
nmap j gj
nmap k gk

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

let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&completefunc:<c-x><c-u>",
\ "&omnifunc:<c-x><c-o>",
\ ]
let g:SuperTabLongestHighlight = 1

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
