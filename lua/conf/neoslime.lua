require('neoslime').setup({
  chosen_channel     = nil, -- The chosen channel to send code to
  per_buffer_channel = false, -- true if you want to set a channel for each buffer
  use_default_neoslime_keybinds = true, -- true if you want to use the default keybinds
  cell_delim = "```", -- The default cell delimiter
  filter_channel = "quarto" -- Filter out channel based on lua pattern matching	(not regex)
})
