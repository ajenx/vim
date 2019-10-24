set nocompatible              " be iMproved, required

syntax enable           " enable syntax processing
set number              " show line numbers
set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set wildignorecase
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set autoindent          " auto indenting
set undofile
set ignorecase
set smartcase
au BufRead,BufNewFile *.ts set syntax=javascript
set path=$PWD/**
set wildignore+=*/node_modules/*
set wildignore+=*/dist/*
set wildignore+=*/tags
set directory=/tmp//
set backupdir=/tmp//
set undodir=/tmp//
set tags+=~/tags/tags_cpp_include
let &grepprg='grep -n --exclude={*.a,tags} --exclude-dir={node_modules,dist,build,stage,reports} $* /dev/null'

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
:au InsertLeave * match ExtraWhitespace /\s\+$/

" let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"  autocmd VimEnter * :Vexplore
" augroup END
