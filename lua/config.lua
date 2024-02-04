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
	cmd = {"/home/markus/scripts/ltex-ls-16.0.0/bin/./ltex-ls"},
	filetypes = {"markdown", "quarto", "mail"}
}

vim.diagnostic.config {
  virtual_text = false,
}
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "r", "lua", "python", "markdown", "csv", "markdown_inline"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require("telescope").setup {
  extensions = {
    file_browser = {
      hijack_netrw = true
    }
  },
  pickers = {
    buffers = {
      mappings = {
	i = {
	  ["<c-d>"] = "delete_buffer",
	},
	n = {
	  ["<c-d>"] = "delete_buffer",
	},
      }
    }
  }
}

require("telescope").load_extension "file_browser"

require('neogit').setup {}

vim.cmd.colorscheme "catppuccin"
vim.cmd('highlight ColorColumn ctermbg=black')
vim.cmd('highlight CursorLine cterm=none ctermbg=none ctermfg=none guibg=none guifg=none')
vim.cmd('highlight CursorLineNr guifg=#FAE3B0')
