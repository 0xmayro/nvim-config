return {
	'williamboman/mason.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	cmd = 'Mason',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
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
			ensure_installed = {
				'lua_ls',
				'rust_analyzer',
				'pyright',
				'tsserver',
				'svelte',
				'html',
				'cssls',
				'clangd',
			},
		})

		require('mason-tool-installer').setup({
			ensure_installed = {
				'stylua',
				'prettierd',
				'clang-format',

				'eslint_d',
				'ruff',
			},
			run_on_Start = true,
			start_delay = 3000,
		})
	end,
}
