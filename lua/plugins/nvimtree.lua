return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
		require('nvim-tree').setup({

			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
			},
		})

		local keymap = vim.keymap
		opts = { noremap = true, silent = true }
		keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', opts)
		keymap.set('n', '<leader>ef', '<cmd>NvimTreeFocus<CR>', opts)
	end
}
