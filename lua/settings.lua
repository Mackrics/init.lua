-- Miscellaneous ---------------------------------------------------------------
local set = vim.opt
set.tabstop = 8
set.shiftwidth = 8
set.colorcolumn = '80'
set.mouse = a
set.number = true
set.cursorline = true
set.scrolloff = 8
set.spell = true
set.spelllang = 'en_us,sv'
set.shellcmdflag = '-ic'

-- Aliases ---------------------------------------------------------------------
vim.cmd("let MYVIMRC = '.config/nvim/init.vim'")
