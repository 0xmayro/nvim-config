return {
	'stevearc/oil.nvim',
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('oil').setup({
			view_options = {
				show_hidden = true,
			},
		})

		local nmap = require('utils.keymap').nmap
		nmap('-', '<CMD>Oil<CR>', 'Open perant directory')
	end,
}
