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


require('lspconfig').zk.setup{}

require('lspconfig').air.setup{
  cmd = { "/home/mackrics/git-repos/air/target/debug/./air", "language-server" }
}

require('lspconfig').harper_ls.setup {
  settings = {
    ["harper-ls"] = {
      userDictPath = "~/.config/nvim/spell/en.utf-8.add"
    }
  }
}

require('lspconfig').rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

require('lspconfig').openscad_lsp.setup{}

vim.diagnostic.config {
  virtual_text = false,
}
