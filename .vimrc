" ----------
" Vim Config
" ----------
"
"
" How this works:
"
" This file is minimal.  Most of the vim settings and initialization is in
" several files in .vim/init.  This makes it easier to find things and to
" merge between branches and repos.
"
" Please do not add configuration to this file, unless it *really* needs to
" come first or last, like Pathogen and sourcing the machine-local config.
" Instead, add it to one of the files in .vim/init, or create a new one.

set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Deps
Bundle 'gmarik/vundle'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

" General
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'matchit.zip'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" General Programming
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'airblade/vim-gitgutter'
if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif

" Javascript
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'

" HTML
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'othree/html5.vim'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'thoughtbot/vim-rspec'
Bundle 'rking/vim-detailed'
Bundle 'tpope/vim-endwise'
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" Misc
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rake'

syntax on
filetype plugin indent on

runtime! init/**.vim

if filereadable($HOME . "/.vimrc.local")
 source ~/.vimrc.local
endif

set background=dark
colorscheme Tomorrow-Night
let g:Powerline_symbols = 'fancy'

set rnu
set number
set ruler

:command NE NERDTree

set encoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
let g:airline_powerline_fonts = 1

" set the cursor to a vertical line in insert mode and a solid block
" in command mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Formatting
set textwidth=80                " wrap at 80 chars by default
set nowrap                      " wrap long lines
set autoindent                  " indent at the same level of the previous line
set smartindent                 " be smart about it
set shiftwidth=2                " use indents of 2 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=2                   " an indentation every two columns
set softtabstop=2               " let backspace delete indent
set nosmarttab                  " fuck tabs
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map 0 ^
map \ :NERDTreeToggle<CR>
