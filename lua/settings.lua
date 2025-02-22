-- Miscellaneous ---------------------------------------------------------------
local set = vim.opt
set.shiftwidth = 2
set.tabstop = 8
set.softtabstop = 2
set.colorcolumn = '80'
set.mouse = a
set.number = true
set.relativenumber = true
set.cursorline = true
set.scrolloff = 8
set.spell = true
set.spelllang = 'en_us,sv'
set.shell = 'bash'

-- Themes ----------------------------------------------------------------------
vim.cmd.colorscheme "catppuccin"
vim.cmd('highlight ColorColumn ctermbg=black')
vim.cmd('highlight CursorLine cterm=none ctermbg=none ctermfg=none guibg=none guifg=none')
vim.cmd('highlight CursorLineNr guifg=#FAE3B0')
vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')

-- Aliases ---------------------------------------------------------------------
vim.cmd("let MYVIMRC = '~/.config/nvim/init.vim'")

-- Skeletons -------------------------------------------------------------------
vim.cmd("autocmd BufNewFile *.sh 0r ~/zettelkasten/.zk/templates/shell-script.sh")
vim.cmd("autocmd BufNewFile ~/zettelkasten/journal/daily/*.md 0r  ~/zettelkasten/.zk/templates/daily.md")
vim.cmd("autocmd BufNewFile ~/zettelkasten/journal/weekly/*.md 0r ~/zettelkasten/.zk/templates/weekly.md")
