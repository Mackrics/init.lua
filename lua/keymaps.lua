-- Setup leader key ------------------------------------------------------------
vim.g.mapleader = " "

-- Manage windows --------------------------------------------------------------
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>h", "<Cmd> wincmd h<CR>")
vim.keymap.set("n", "<leader>j", "<Cmd> wincmd j<CR>")
vim.keymap.set("n", "<leader>k", "<Cmd> wincmd k<CR>")
vim.keymap.set("n", "<leader>l", "<Cmd> wincmd l<CR>")
vim.keymap.set("n", "L", "<Cmd> tabn <CR>")
vim.keymap.set("n", "H", "<Cmd> tabp <CR>")
vim.keymap.set("n", "<leader>x", "<Cmd> bd <CR>")
vim.keymap.set("n", "<leader>X", "<Cmd> bd! <CR>")
vim.keymap.set("n", "<leader>+", "<Cmd> resize +5<CR>")
vim.keymap.set("n", "<leader>-", "<Cmd> resize -5<CR>")
vim.keymap.set("n", "<leader>>", "<Cmd> vertical resize +5<CR>")
vim.keymap.set("n", "<leader><", "<Cmd> vertical resize -5<CR>")

-- Terminal behaviour ----------------------------------------------------------
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Plugin settings -------------------------------------------------------------
vim.keymap.set("n", "<leader>n", "<Cmd> NERDTreeToggle<CR>")
vim.keymap.set("n", "<leader>N", "<Cmd> NERDTree<CR>")
vim.keymap.set("n", "<leader>s", "<Plug>SlimeSendCell")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- Miscellaneous ---------------------------------------------------------------
vim.keymap.set("n", "<leader>ls", "<Cmd> ls<CR>")
vim.keymap.set("n", "G", "Gzz")

-- Scrolling -------------------------------------------------------------------
vim.keymap.set("n", "<C-k>", "{k")
vim.keymap.set("n", "<C-j>", "}j")

-- Commands --------------------------------------------------------------------
vim.keymap.set("n", "qp", "<Cmd>QuartoPreview<Cr>")
vim.keymap.set("n", "qr", "<Cmd>QuartoRender<Cr>")
vim.keymap.set("n", "qc", "<Cmd>QuartoCheck<Cr>")


