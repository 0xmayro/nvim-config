return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',

		-- language spacific plugins
		'simrat39/rust-tools.nvim',
		'folke/neodev.nvim',
	},
	config = function() end,
}
