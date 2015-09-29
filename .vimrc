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
filetype off

call plug#begin()

" Deps
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" General
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor\/cache'
Plug 'matchit.zip'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" General Programming
Plug 'mattn/gist-vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
if executable('ctags')
  Plug 'majutsushi/tagbar'
endif
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'rking/ag.vim'
Plug 'wavded/vim-stylus'

" Javascript
Plug 'leshill/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'

" HTML
Plug 'ChrisYip/Better-CSS-Syntax-for-Vim'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
let g:rspec_runner = "os_x_iterm"
Plug 'jgdavey/tslime.vim'
let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'
Plug 'rking/vim-detailed'
Plug 'tpope/vim-endwise'
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" Misc
Plug 'tpope/vim-markdown'
Plug 'embear/vim-localvimrc'

call plug#end()

syntax on
filetype plugin indent on

runtime! init/**.vim

if filereadable($HOME . "/.vimrc.local")
 source ~/.vimrc.local
endif

set t_Co=256
set background=dark
colorscheme tomorrow-night
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
set pastetoggle=<F2>           " pastetoggle (sane indentation on pastes)
set cursorline
set mouse=a                     " scroll and select with mouse

set scrolloff=5
set backspace=2
set noswapfile

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map 0 ^
map <Leader> :NERDTreeToggle<CR>

set splitbelow
set splitright

let mapleader=" "
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
imap jj <Esc>

autocmd BufRead,BufNewFile js.erb set filetype=eruby.javascript
autocmd BufRead,BufNewFile css.erb set filetype=eruby.css
autocmd BufRead,BufNewFile scss.erb set filetype=eruby.scss
