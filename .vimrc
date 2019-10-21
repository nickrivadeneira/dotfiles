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
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
Plug 'matchit.zip'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" General Programming
Plug 'mattn/gist-vim'
let g:gist_post_private = 1
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'rking/ag.vim'
Plug 'wavded/vim-stylus'

" Javascript
Plug 'leshill/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/yajs'
Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,underscore'

" HTML
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'nickrivadeneira/vim-spec-runner', { 'branch': 'nr-es6' }
let g:rspec_runner = "os_x_iterm"
Plug 'jgdavey/tslime.vim'
let g:disable_write_on_spec_run = 1
let g:spec_runner_dispatcher = 'call Send_to_Tmux("{command}\n")'
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

" Set regex engine to older version for faster ruby syntax highlighting
set re=1

:command NE NERDTree
:command NF NERDTreeFind

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
set textwidth=0                 " don't wrap
set nowrap                      " don't wrap long lines
set autoindent                  " indent at the same level of the previous line
set smartindent                 " be smart about it
set shiftwidth=2                " use indents of 2 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=2                   " an indentation every two columns
set softtabstop=2               " let backspace delete indent
set nosmarttab                  " fuck tabs
set pastetoggle=<F2>            " pastetoggle (sane indentation on pastes)
set cursorline
set mouse=a                     " scroll and select with mouse

" This unsets the last search pattern register by hitting return
set hlsearch
nnoremap <CR> :noh<CR><CR>

set scrolloff=5
set backspace=2
set noswapfile
set lazyredraw
set showcmd

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map 0 ^
map <Leader> :NERDTreeToggle<CR>

" Paste in visual mode without replacing register
vmap r "_dP

set splitbelow
set splitright

let mapleader=" "

map <Leader>t <Plug>RunCurrentSpecFile
map <Leader>s <Plug>RunFocusedSpec
map <Leader>l <Plug>RunMostRecentSpec
imap jj <Esc>

autocmd BufRead,BufNewFile js.erb set filetype=eruby.javascript
autocmd BufRead,BufNewFile css.erb set filetype=eruby.css
autocmd BufRead,BufNewFile scss.erb set filetype=eruby.scss
autocmd BufRead,BufNewFile *es6 set filetype=javascript
autocmd BufRead,BufNewFile *es6.erb set filetype=eruby.javascript
