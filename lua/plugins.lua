local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



local plugins = {

  -- send stuff to terminal
  --"mackrics/neoslime",
  {
  dir = "~/git-repos/neoslime", -- Your path
  name = "neoslime",
  config = function ()
    require('neoslime')
  end
},


  -- syntax highlightning
  'nvim-treesitter/nvim-treesitter',

   -- dependency of a lot of packages
  "nvim-lua/plenary.nvim",
 
   -- File search
  "nvim-telescope/telescope.nvim",
 
   -- Color theme
  "catppuccin/nvim",
 
  "stevearc/dressing.nvim",

  "nvim-telescope/telescope-file-browser.nvim",
 
   -- Custom line
  "nvim-lualine/lualine.nvim",
  
  "NeogitOrg/neogit",
   -- Easily change sessions
  "Shatur/neovim-session-manager",
  "tpope/vim-fugitive",
 
   -- Use snippets
  "L3MON4D3/LuaSnip",
 
   -- Autocomplete
  "hrsh7th/nvim-cmp",
 	
   -- Autocomplete Directories
  "hrsh7th/cmp-path",
 
   -- Autocomplete Languageserver
  "hrsh7th/cmp-nvim-lsp",
 
  -- LSP configuration
  "neovim/nvim-lspconfig",
 
   -- Autocomplete snippets
  "saadparwaiz1/cmp_luasnip",

  "David-Kunz/gen.nvim",

  "FabijanZulj/blame.nvim",
  
  "lewis6991/gitsigns.nvim"
}
require("lazy").setup(plugins, opts)
