return {
	'neovim/nvim-lspconfig',
	event = 'BufReadPre',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		require('lspconfig').setup()
	end
}
