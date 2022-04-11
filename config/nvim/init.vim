set nocompatible              " be iMproved, required

syntax enable           " enable syntax processing
set background=dark
set number              " show line numbers
set ruler
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
"au BufRead,BufNewFile *.ts set syntax=javascript
set path=$PWD/**
set wildignore+=*/node_modules/*
set wildignore+=*/dist/*
set directory=/tmp//
set backupdir=/tmp//
set undodir=/tmp//
let &grepprg='grep -n --exclude={*.a} --exclude-dir={node_modules,dist,build,stage,reports} $* /dev/null'

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
:au InsertLeave * match ExtraWhitespace /\s\+$/

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-fugitive'
call plug#end()
autocmd vimenter * ++nested colorscheme gruvbox

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << eof
require('telescope').setup{
    pickers = {
        find_files = {
            theme = "dropdown",
            layout_config = { width = 0.8, height = 0.5 }
        },
        live_grep = {
            theme = "dropdown",
            layout_config = { width = 0.8, height = 0.5 }
        },
    }
}
eof

" let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-css',
\ 'coc-angular',
\ 'coc-snippets',
\ 'coc-rls',
"\ 'coc-clangd'
\ ]
" augroup ProjectDrawer
"   autocmd!
"  autocmd VimEnter * :Vexplore
" augroup END


" Coc settings

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <tab>
"      \ pumvisible() ? "\<c-n>" :
"       \ <sid>check_back_space() ? "\<tab>" :
"       \ coc#refresh()
" inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

" coc snippet version
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:get_filename_with_extension(ext)
    return substitute(expand('%:p'), '\(\.spec\)\?\.\(\w*\)\+$', '.' . a:ext, 'g')
endfunction

function! s:open_filename_as(ext)
    execute 'e ' . s:get_filename_with_extension(a:ext)
endfunction

command! GotoHtml :call s:open_filename_as('html')
command! GotoCss :call s:open_filename_as('css')
command! GotoTs :call s:open_filename_as('ts')
command! GotoSpec :call s:open_filename_as('spec.ts')

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


autocmd FileType typescript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab

