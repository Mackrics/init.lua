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
	cmd = {"/home/markus/scripts/ltex-ls-16.0.0/bin/./ltex-ls"},
	filetypes = {"markdown", "quarto", "mail"}
}

require'lspconfig'.zk.setup{}

vim.diagnostic.config {
  virtual_text = false,
}
