set nocompatible
set encoding=utf-8

" Vundle

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Lokaltog/vim-powerline'
Bundle 'chriskempson/base16-vim'
Bundle 'danro/rename.vim'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'guns/vim-clojure-static'
Bundle 'isRuslan/vim-es6'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'renderedtext/vim-bdd'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'

filetype plugin indent on

syntax enable

runtime macros/matchit.vim          " Enables % to cycle through `if/else/endif`, recognizing Ruby blocks, etc.

set number
set ruler                           " Show the cursor position all the time
set cursorline                      " Highlight the line of the cursor
set showcmd                         " Show partial commands below the status line
set shell=bash                      " Avoids munging PATH under zsh
let g:is_bash=1                     " Default shell syntax
set history=200                     " Remember more Ex commands
set scrolloff=3                     " Have some context around the current line always
                                    " on screen
set noerrorbells visualbell t_vb=   " Disable bell
set hidden                          " Allow backgrounding buffers without writing
                                    " them, and remember marks/undo for backgrounded
                                    " buffers
set backupdir=~/.vim/_backup        " where to put backup files.
set directory=~/.vim/_temp          " where to put swap files.

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set backspace=indent,eol,start    " backspace through everything in insert mode

" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter

function s:setupWrappingAndSpellcheck()
  set wrap
  set wrapmargin=2
  set textwidth=80
  set spell
endfunction

if has("autocmd")
  " Delete empty space from the end of lines on every save
  au BufWritePre * :%s/\s\+$//e

  " Make sure all markdown files have the correct filetype set and setup
  " wrapping and spell check
  au BufRead,BufNewFile *.{md,md.erb,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrappingAndSpellcheck()

  " Spellcheck
  au BufRead,BufNewFile *.feature setlocal spell

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " mark Jekyll YAML frontmatter as comment
  au BufNewFile,BufRead *.{md,markdown,html,xml} sy match Comment /\%^---\_.\{-}---$/

  " Clojure
  au BufRead,BufNewFile *.{cljs,boot} setlocal filetype=clojure

  " Git
  au Filetype gitcommit setlocal spell textwidth=72
endif

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

let mapleader=" "

" paste lines from unnamed register and fix indentation
nmap <leader>p pV`]=
nmap <leader>P PV`]=

inoremap jj <Esc>

map <leader>ga :CtrlP app<cr>
map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gf :CtrlP features<cr>
map <leader>gs :CtrlP spec<cr>
map <leader>gt :CtrlP test<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>f :CtrlP ./<cr>
map <leader>b :CtrlPBuffer<cr>

map <leader>gd :e db/schema.rb<cr>
map <leader>gr :e config/routes.rb<cr>
map <leader>s :A<CR>
map <leader>v :AV<CR>

" ignore Rubinius, Sass cache files
set wildignore+=tmp/**,*.rbc,.rbx,*.scssc,*.sassc
set wildignore+=*/vendor/*

nnoremap <leader><leader> <c-^>

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" map Ctrl+S to :w
noremap <silent> <C-S>  :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r

  " Add fugitive
  set statusline+=%{fugitive#statusline()}

  " Finish the statusline
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nmap <leader>a :Ack ""<Left>
nmap <leader>A :Ack <C-r><C-w><CR>

" Color scheme
let base16colorspace=256
set background=dark
colorscheme base16-mocha
