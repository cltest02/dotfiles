" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
"set t_Co=256

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  " Enable coloring for dark background terminals.
  set background=dark
  " Use the Molokai theme (originally created for TextMate by Wimer Hazenberg)
  colorscheme molokai
  " Turn on color syntax highlighting
  syntax on
  syn sync fromstart
  " set to 256 colors
  set t_Co=256
  " Also switch on highlighting the last used search pattern.
  set hlsearch
  " Highlight current line
  set cursorline
endif

" set the shell
set shell=bash

" Enable filetype detection
filetype on

" Enable filetype-specific plugins
filetype plugin on

" Enable filetype-specific indenting
filetype indent on

" pasting text unmodified from other applications
set paste

" Try to detect file formats.
" Unix for new files and autodetect for the rest.
set fileformats=unix,dos,mac

" Free cursor
set whichwrap=b,s,h,l,<,>,[,]

" Make the status line always visible.
set laststatus=2

" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Type of wildmenu.
set wildmode=longest:full,list:full

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Keep 50 lines of command line history
set history=100

if v:version >= 500
  " Try reducing the number of lines stored in a register
  set viminfo='500,f1,:100,/100
endif

" Keep a backup-file
set backup
set writebackup

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Look for embedded modelines at the top of the file.
set modeline

" Only look at this number of lines for modeline
set modelines=10

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" disable line numbers
set nonumber

" don't automatically wrap on load
set nowrap

" don't automatically wrap text when typing
set fo-=t

" Make tabs as wide as two spaces -> you can also use :retab
set tabstop=2

" Number of spaces to use for each step of indent.
set shiftwidth=2
set softtabstop=2

" Expand tabs to spaces.
set expandtab

" Insert spaces for tabs according to shiftwidth.
set smarttab

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

" Ignore case of searches
set ignorecase

" Use intelligent case while searching.
" If search string contains an upper case letter, disable ignorecase.
set smartcase

" Incremental searching
set incsearch

" Enable mouse in all modes
"set mouse=a

" Hide the mouse while typing.
"set mousehide

" Enable the popup menu.
"set mousem=popup

" Split vertically to the right.
set splitright

" Split horizontally below.
set splitbelow

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Disable the splash screen (and some various tweaks for messages).
set shortmess=aTItoO

" Status line definition.
set statusline=[%n]\ %<%f%m%r\ %w\ %y\ \ <%{&fileformat}>%=[%o]\ %l,%c%V\/%L\ \ %P

" Show current mode in the status line.
set showmode

" Show the (partial) command as it’s being typed
set showcmd

" Show the filename in the window titlebar
set title

" When closing a block, show the matching bracket.
set showmatch

" Include angle brackets in matching.
set matchpairs+=<:>

" Do not redraw the screen while macros are running.
set lazyredraw

" Save files before performing certain actions.
"set autowrite

" Use relative line numbers
"if exists("&relativenumber")
" set relativenumber
" au BufReadPost * set relativenumber
"endif

" Start scrolling at this number of lines from the bottom.
"set scrolloff=2

" Start scrolling three lines before the horizontal window border
"set scrolloff=3

" Start scrolling horizontally at this number of columns.
"set sidescrolloff=5

" copy between different vim sessions
:nmap _Y :!echo “”> ~/.vim/tmp<CR><CR>:w! ~/.vim/tmp<CR>
:vmap _Y :w! ~/.vim/tmp<CR>
:nmap _P :r ~/.vim/tmp<CR>

" Stop opening man pages
:nmap K <nop>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif
