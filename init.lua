-- Key remaps ------------------------------------------------------------------
require("keymaps")

-- Settings --------------------------------------------------------------------
require("settings")

-- Load plugins  ---------------------------------------------------------------
require("plugins")

-- Load commands ---------------------------------------------------------------
require("commands")

-- Load Configurations ---------------------------------------------------------
require("telescope-conf")
require("treesitter-conf")
require("neogit-conf")
require("sessionmanager-conf")
require("gen-conf")
require("gitsigns-conf")
require("config")

-- Load snippets ---------------------------------------------------------------
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})

require("neoslime").setup({
  chosen_channel = nil
})
