return {
	'stevearc/oil.nvim',
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('oil').setup()
		local nmap = require('utils.functions').nmap

		nmap('<leader>e', '<CMD>Oil<CR>', 'Open Oil')
	end,
}
