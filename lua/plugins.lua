return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Send stuff to terminal
  use 'jpalardy/vim-slime'

  -- Manage files
  use 'preservim/nerdtree'

  -- dependency of a lot of packages
  use 'nvim-lua/plenary.nvim'

  -- File search
  use 'nvim-telescope/telescope.nvim'

  -- Color theme
  use 'catppuccin/nvim'

  -- Pandoc syntax highlightning
  use 'vim-pandoc/vim-pandoc-syntax'

  -- Easily change sessions
  use 'Shatur/neovim-session-manager'

  use 'stevearc/dressing.nvim'

  -- Quarto syntax highlightning
  use 'quarto-dev/quarto-vim'

  -- Custom line
  use 'nvim-lualine/lualine.nvim'

  -- Git plugin
  use 'tpope/vim-fugitive'

  -- Use snippets
  use "L3MON4D3/LuaSnip"

  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
	
  -- Autocomplete Directories
  use 'hrsh7th/cmp-path'

  -- Autocomplete Languageserver
  use 'hrsh7th/cmp-nvim-lsp'

 -- LSP configuration
  use 'neovim/nvim-lspconfig'

  -- Autocomplete snippets
  use 'saadparwaiz1/cmp_luasnip'

end)

