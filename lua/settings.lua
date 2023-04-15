-- Miscellaneous ---------------------------------------------------------------
local set = vim.opt
set.tabstop = 2
set.shiftwidth = 2
set.colorcolumn = '80'
set.mouse = a
set.number = true
set.cursorline = true
set.scrolloff = 8
set.spell = true
set.spelllang = 'en_us,sv'
set.shellcmdflag = '-ic'

-- Theme color -----------------------------------------------------------------
vim.cmd('colorscheme catppuccin')
vim.g['catppuccin_flavour'] = 'mocha'

vim.cmd('highlight ColorColumn ctermbg=black')
vim.cmd('highlight CursorLine cterm=none ctermbg=none ctermfg=none guibg=none guifg=none')
vim.cmd('highlight CursorLineNr guifg=#FAE3B0')

-- Aliases ---------------------------------------------------------------------
vim.cmd("let MYVIMRC = '.config/nvim/init.vim'")
