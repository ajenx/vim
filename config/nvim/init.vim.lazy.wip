set nocompatible              " be iMproved, required

syntax enable           " enable syntax processing
set background=dark
set number              " show line numbers
set ruler
set tabstop=2           " number of visual spaces per TAB
set shiftwidth=2
set softtabstop=2       " number of spaces in tab when editing
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
"au BufRead,BufNewFile *.ts set syntax=javascript
set path=$PWD/**
set wildignore+=*/node_modules/*
set wildignore+=*/dist/*
set directory=/tmp//
set backupdir=/tmp//
set undodir=/tmp//
let &grepprg='grep -n --exclude={*.a} --exclude-dir={.git,node_modules,dist,build,stage,reports} $* /dev/null'

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
:au InsertLeave * match ExtraWhitespace /\s\+$/

lua require('config.lazy')

" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
let g:netrw_winsize = 25

function! s:get_filename_with_extension(ext)
    return substitute(expand('%:p'), '\(\.spec\)\?\.\(\w*\)\+$', '.' . a:ext, 'g')
endfunction

function! s:open_filename_as(ext)
    execute 'e ' . s:get_filename_with_extension(a:ext)
endfunction

command! GotoHtml :call s:open_filename_as('html')
command! GotoCss :call s:open_filename_as('css')
command! GotoScss :call s:open_filename_as('scss')
command! GotoTs :call s:open_filename_as('ts')
command! GotoSpec :call s:open_filename_as('spec.ts')

autocmd FileType typescript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab

