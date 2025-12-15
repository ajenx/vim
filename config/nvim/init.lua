vim.cmd([[syntax enable]])           -- enable syntax processing
vim.opt.background=dark
vim.opt.number=true              -- show line numbers
vim.opt.ruler=true
vim.opt.tabstop=2           -- number of visual spaces per TAB
vim.opt.shiftwidth=2
vim.opt.softtabstop=2       -- number of spaces in tab when editing
vim.opt.expandtab=true           -- tabs are spaces
vim.opt.showcmd=true             -- show command in bottom bar
vim.opt.cursorline=true          -- highlight current line
vim.opt.wildmenu=true            -- visual autocomplete for command menu
vim.opt.wildignorecase=true
vim.opt.lazyredraw=true          -- redraw only when we need to.
vim.opt.showmatch=true           -- highlight matching [{()}]
vim.opt.incsearch=true           -- search as characters are entered
vim.opt.hlsearch=true            -- highlight matches
vim.opt.autoindent=true          -- auto indenting
vim.opt.undofile=true
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.path = { '$PWD/** ' }
vim.opt.wildignore:append { '*/node_modules/*', '*/dist/*' }
vim.opt.directory='/tmp//'
vim.opt.backupdir='/tmp//'
vim.opt.undodir='/tmp//'
vim.opt.list=true
vim.cmd([[let &grepprg='grep -n --exclude={*.a} --exclude-dir={.git,node_modules,dist,build,stage,reports} $* /dev/null']])

-- vim.cmd([[highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen]])
-- vim.cmd([[:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/]])
-- vim.cmd([[:au InsertLeave * match ExtraWhitespace /\s\+$/]])

require('config.lazy')

-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()

-- let g:netrw_banner = 0
vim.g.netrw_liststyle = 3
-- let g:netrw_browse_split = 4
-- let g:netrw_altv = 1
vim.g.netrw_winsize = 25

function open_filename_as(ext)
    vim.api.nvim_command('e ' .. get_filename_with_extension(ext))
end

function get_filename_with_extension(ext)
    return vim.fn.substitute(vim.fn.expand('%:p'), '\\(\\.spec\\)\\?\\.\\(\\w*\\)\\+$', '.' .. ext, 'g')
end

vim.api.nvim_create_user_command(
  'GotoHtml',
  function()
    open_filename_as('html')
  end,
  {
    nargs = 0
  }
)

vim.api.nvim_create_user_command(
  'GotoCss',
  function()
    open_filename_as('css')
  end,
  {
    nargs = 0
  }
)

vim.api.nvim_create_user_command(
  'GotoScss',
  function()
    open_filename_as('scss')
  end,
  {
    nargs = 0
  }
)

vim.api.nvim_create_user_command(
  'GotoTs',
  function()
    open_filename_as('ts')
  end,
  {
    nargs = 0
  }
)

vim.api.nvim_create_user_command(
  'GotoSpec',
  function()
    open_filename_as('spec.ts')
  end,
  {
    nargs = 0
  }
)

vim.cmd([[autocmd FileType typescript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab]])
vim.cmd([[autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab]])
vim.cmd([[autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab]])
vim.cmd([[autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab]])

