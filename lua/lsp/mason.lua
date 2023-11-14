return {
	'williamboman/mason.nvim',
	lazy = false,
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		require('mason').setup({
			ui = {
				icons = {
					package_installed = '',
          package_pending = '',
          package_uninstalled = '',
				},
			},
		})
		require('mason-lspconfig').setup({
			ensure_installed = { 'lua_ls', 'rust_analyzer', 'pyright', 'tsserver', },
		})
	end,
}
