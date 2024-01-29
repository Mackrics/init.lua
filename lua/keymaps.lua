-- Setup leader key ------------------------------------------------------------
vim.g.mapleader = " "

-- Manage windows --------------------------------------------------------------
vim.keymap.set("n", "<leader>v", vim.cmd.vsplit)
vim.keymap.set("n", "L", "<Cmd> tabn <CR>")
vim.keymap.set("n", "H", "<Cmd> tabp <CR>")
vim.keymap.set("n", "<leader>x", "<Cmd> bd <CR>")
vim.keymap.set("n", "<leader>X", "<Cmd> bd! <CR>")
vim.keymap.set("n", "<leader>p", "<Cmd>b#<CR>")
vim.keymap.set("n", "<leader>+", "<Cmd> resize +5<CR>")
vim.keymap.set("n", "<leader>-", "<Cmd> resize -5<CR>")
vim.keymap.set("n", "<leader>>", "<Cmd> vertical resize +5<CR>")
vim.keymap.set("n", "<leader><", "<Cmd> vertical resize -5<CR>")

-- Terminal behaviour ----------------------------------------------------------
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Plugin settings -------------------------------------------------------------
vim.keymap.set("n", "<leader>n", "<Cmd> Telescope file_browser<CR>")

vim.api.nvim_set_keymap(
  "n",
  "<leader>N",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)


vim.keymap.set("n", "<leader>s", "<Plug>SlimeSendCell")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- Miscellaneous ---------------------------------------------------------------
vim.keymap.set("n", "G", "Gzz")

-- Scrolling -------------------------------------------------------------------
vim.keymap.set("n", "<C-k>", "{k")
vim.keymap.set("n", "<C-j>", "}j")

-- Commands --------------------------------------------------------------------
vim.keymap.set("n", "<leader>qpp", "<Cmd>QuartoPreviewProject<Cr>")
vim.keymap.set("n", "<leader>qpf", "<Cmd>QuartoPreviewFile<Cr>")
vim.keymap.set("n", "<leader>qrp", "<Cmd>QuartoRenderProject<Cr>")
vim.keymap.set("n", "<leader>qrf", "<Cmd>QuartoRenderFile<Cr>")
vim.keymap.set("n", "<leader>qc",  "<Cmd>QuartoCheck<Cr>")
vim.keymap.set("n", "<leader>ff",  "<Cmd>Telescope fd<Cr>")
vim.keymap.set("n", "<leader>fd",  "<Cmd>Telescope fd<Cr>")
vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fs", "<Cmd>LSession<CR>")
vim.keymap.set("n", "<leader>fr",  "<Cmd>Telescope live_grep<Cr>")
vim.keymap.set("n", "<leader>fj",  "<Cmd>Telescope jumplist<Cr>")
vim.keymap.set("n", "<leader>fc",  "<Cmd>Telescope current_buffer_fuzzy_find<Cr>")
vim.keymap.set("n", "<leader>gs",  "<Cmd>Telescope git_status<Cr>")
vim.keymap.set("n", "<leader>gb",  "<Cmd>Telescope git_branches<Cr>")
vim.keymap.set("n", "<leader>gl",  "<Cmd>Telescope git_commits<Cr>")
vim.keymap.set("n", "<leader>gn",  "<Cmd>Neogit<Cr>")
vim.api.nvim_set_keymap('i','<C-l>','<cmd>lua r_pipe()<cr>',{})
vim.api.nvim_set_keymap('i','<C-v>','<cmd>lua r_in()<cr>',{})
vim.api.nvim_set_keymap('i','<C-b>','<cmd>lua r_arrow()<cr>',{})
