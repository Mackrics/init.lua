return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'jpalardy/vim-slime'

  use 'preservim/nerdtree'

  use 'nvim-lua/plenary.nvim'

  use 'nvim-telescope/telescope.nvim'

  use 'vimwiki/vimwiki'

  use 'catppuccin/nvim'

  use 'vim-pandoc/vim-pandoc-syntax'

	use 'Shatur/neovim-session-manager'

  use 'stevearc/dressing.nvim'

	use 'quarto-dev/quarto-vim'

	use 'nvim-lualine/lualine.nvim'

	use 'tpope/vim-fugitive'

	use "L3MON4D3/LuaSnip"

  use 'hrsh7th/nvim-cmp'
	
	use 'hrsh7th/cmp-path'

	use 'hrsh7th/cmp-nvim-lsp'

	use 'neovim/nvim-lspconfig'

  use 'saadparwaiz1/cmp_luasnip'

end)

