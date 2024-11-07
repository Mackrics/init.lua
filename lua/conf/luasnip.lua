-- Luasnip ---------------------------------------------------------------------
vim.cmd[[
" Use C-m to expand and jump through snippets
imap <silent><expr> <C-m> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-m>' 
smap <silent><expr> <C-m> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-m>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

-- Load snippets ---------------------------------------------------------------
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})
