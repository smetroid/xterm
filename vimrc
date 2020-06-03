set t_Co=256                 " required in order to get solarized working on a remote server

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" All of your Plugins must be added before the following line
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
"git clone https://github.com/roman/golden-ratio
"git clone https://github.com/zhaocai/GoldenView.Vim
"git clone https://github.com/jistr/vim-nerdtree-tabs
"git clone https://github.com/vim-scripts/SearchComplete
" Plugin 'ervandew/supertab'
"git clone https://github.com/majutsushi/tagbar
"git clone https://github.com/vim-scripts/taglist.vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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

"" Vue not working
"Plugin 'posva/vim-vue'
"Plugin 'leafOfTree/vim-vue-plugin'
"
"Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'ervandew/supertab'
" Plugin 'edkolev/tmuxline.vim'

" Terraform plugins
Plugin 'hashivim/vim-terraform'
Plugin 'juliosueiras/vim-terraform-completion'

" Language specific
Plugin 'fatih/vim-go'
Plugin 'klen/python-mode'
Plugin 'Blackrush/vim-gocode'

" rainbow color syntax
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

"fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'

"JavaScript syntax
Plugin 'sheerun/vim-polyglot'

" ESLint settings
Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'

call vundle#end()            " required
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required


" Vim Settings
set nu
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
retab
"set paste      " Causes supertab to misbehave

" vim vue settings
"let g:vue_disable_pre_processors = 1
"autocmd BufNewFile,BufRead *.vue set ft=vue
"autocmd BufNewFile,BufRead *.vue,*.ts: set filetype=html


" Ale Settings
let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier']
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
"let g:ale_fix_on_save = 1

" ESLint Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'


" Solarized colorscheme things
let g:solarized_termcolors=256
let g:solarized_termtrans=1
syntax enable
syntax on
colorscheme solarized
set background=dark
"
"Getting vue working
"let g:vue_disable_pre_processors=1
"autocmd FileType vue syntax sync fromstart
"autocmd BufRead,BufNewFile *.vue setlocal
"filetype=vue.html.javascript.css.less.pug

let python_highlight_all = 1
let mapleader = ","
nmap <leader>ne :NERDTree<cr>

" filetype plugin indent on
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

let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&completefunc:<c-x><c-u>",
\ "&omnifunc:<c-x><c-o>",
\ ]
" Golang specific settings
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

" Toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>
"
" " Toggle line numbers
nnoremap <F3> :set invnumber<CR>


" Vimwiki settings
let g:vimwiki_url_maxsave=0 " remove the shortening of the url

" vim-airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
"let g:airline_theme = 'molokai'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
" fuzzy finder
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"
"" for tmuxline + vim-airline integration
"let g:tmuxline_preset = {
"      \'a'    : '#S',
"      \'c'    : ['#(whoami)', '#(uptime | cut -d " " -f 1,2,3)'],
"      \'win'  : ['#I', '#W'],
"      \'cwin' : ['#I', '#W', '#F'],
"      \'x'    : '#(date)',
"      \'y'    : ['%R', '%a', '%Y'],
"      \'z'    : '#H'}
"
"
"let g:tmuxline_separators = {
"    \ 'left' : '',
"    \ 'left_alt': '>',
"    \ 'right' : '',
"    \ 'right_alt' : '<',
"    \ 'space' : ' '}
"
"
"let g:airline#extensions#tmuxline#enabled = 1
"
"" start tmuxline even without vim running
"let airline#extensions#tmuxline#snapshot_file = "~/personal/system/tmux_airline"
"


" Nerdtree devicons configs
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''

set encoding=UTF-8

set pastetoggle=<F5>

" Trying to fix nerdtree slowwness
"set cursorline
set lazyredraw

if &diff
  colorscheme solarized
  set background=dark
endif
