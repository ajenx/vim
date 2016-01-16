"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" run pathogen (plugin handler)
filetype off
execute pathogen#infect()

" generate helptags
call pathogen#helptags()

" no vi-compatible mode
set nocompatible 

" detect file type
filetype on

" load plugin files for specific file types
filetype plugin on

" load indent files for specific file types
filetype indent on

" how many lines of history to remember
set history=500

" ask what to do about unsaved/read-only files
set confirm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
" Enable 256 color support 
set t_Co=256

" colors for dark background 
set background=dark

" syntax highlighting on
syntax on

" colorscheme 
colorscheme xoria256

" same background as terminal
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" make backup before overwriting a file
set wb 

" dont keep backup file
set nobackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" number of pixel lines inserted between characters
set linespace=0

" show current mode
set showmode

" command-line completion operates in an enhanced mode
set wildmenu

" number of screen lines to use for the command-line
set cmdheight=1

" print the line number in front of each line
set number

" make backspace work normal (indent, eol, start)
set backspace=2

" tell when any line is changed via : commands
set report=0

" don't make noise on error messages
set noerrorbells

" hide the mouse while typing
set mousehide

" where and which order auto-completion scans
set complete=.,w,b,t   

" when completing by tag, show the whole tag, not just the function name
set showfulltag 

" Set the textwidth to be 80 chars
set textwidth=80

" automatically read a file that has changed on disk
set autoread

" dictionary for english words
set dictionary=/usr/share/dict/words

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual effects 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight search hit 
set hlsearch

" highlight hits while typing 
set incsearch

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=8

" status line information (with fugitive)
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" status line information (without fugitive)
" set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B] 

" always show the status line no matter how many windows that are open
set laststatus=2

" don't update the display while executing macros
set lazyredraw 

" Allow the cursor to go in to "invalid" places (e.g halfway into a tab)
set virtualedit=all  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tabstops are 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" makes searches wrap around the end of the file 
set wrapscan

" pattern sensitivity.
set noignorecase

" unsaved buffers can be hidden 
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$ 

" how automatic formatting is to be done
set formatoptions=tcrqn

" smart autoindenting for C programs
set smartindent

" do not wrap lines
set nowrap

" use tabs at the start of a line, spaces elsewhere
set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" System default for mappings is now the "," character
let mapleader = ","

" <ESC> alternative
imap jj <esc>
cmap jj <esc>

" Turn off highlight search
nmap <silent> ,n :nohls<CR>

" Window closing
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
"let NERDTreeShowHidden=1

" Fugitive
"

" Next Plugin
"


