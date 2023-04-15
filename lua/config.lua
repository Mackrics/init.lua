-- Lua line --------------------------------------------------------------------
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Session manager -------------------------------------------------------------
local Path = require('plenary.path')
require('session_manager').setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
  path_replacer = '__', -- The character to which the path separator will be replaced for session files.
  colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require('session_manager.config').AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
  },
  autosave_ignore_buftypes = {"terminal"}, -- All buffers of these bufer types will be closed before the session is saved.
  autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})



-- Plugin settings -------------------------------------------------------------
-- Slime
vim.g['slime_target'] = 'neovim'
vim.g['slime_cell_delimiter'] = "```"

-- Luasnip
vim.cmd[[
" Use C-m to expand and jump through snippets
imap <silent><expr> <C-m> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-m>' 
smap <silent><expr> <C-m> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-m>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

-- CMP -------------------------------------------------------------------------
local cmp = require('cmp')
local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup{
  sources = {
    { name = 'path' },
    { name = 'luasnip' },
		{ name = 'nvim_lsp'}
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts)
  }
}

-- Languageserver --------------------------------------------------------------
require'lspconfig'.r_language_server.setup{
	filetypes = {"r", "rmd", "quarto"}
}

require'lspconfig'.ltex.setup{
	cmd = {"/home/mackan/scripts/ltex-ls-16.0.0/bin/./ltex-ls"},
	filetypes = {"markdown", "quarto", "mail"}
}

vim.diagnostic.config {
  virtual_text = false,
}
