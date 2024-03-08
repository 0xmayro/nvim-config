return {
	'folke/trouble.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('trouble').setup()
	end,
}
