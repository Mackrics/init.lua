require('telescope').setup {
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
	}
      }
    }
  }
}

require('telescope').load_extension("file_browser")
