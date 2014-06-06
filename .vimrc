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
let g:ctrlp_use_caching = 0
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
Bundle 'christoomey/vim-tmux-navigator'
if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif

" Javascript
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mustache/vim-mustache-handlebars'

" HTML
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-haml'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'thoughtbot/vim-rspec'
let g:rspec_runner = "os_x_iterm"
Bundle 'jgdavey/tslime.vim'
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
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

set t_Co=256
set background=dark
colorscheme Tomorrow-Night
let g:Powerline_symbols = 'fancy'

" Always show status bar
set laststatus=2

set number
set ruler

:command NE NERDTree

set encoding=utf-8
if has("gui_macvim")
  set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
else
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 14
end
let g:airline_powerline_fonts = 1

" set the cursor to a vertical line in insert mode and a solid block
" in command mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Formatting
set cc=80
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
set cursorline

set scrolloff=5
set backspace=2
set noswapfile

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map 0 ^
map <Leader> :NERDTreeToggle<CR>

let mapleader=" "
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
imap jj <Esc>
