return {
	'williamboman/mason.nvim',
	lazy = false,
	dependencies = {
		'neovim/nvim-lspconfig',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		-- language spacific plugins
		'simrat39/rust-tools.nvim',
		'folke/neodev.nvim',
	},
	config = function()
		local lspconfig = require('lspconfig')
		local lspconfig_settings = require('plugins.lsp.lspconfig')
		local tools = require('utils.tools')

		require('mason').setup({
			ui = {
				icons = {
					package_installed = '',
					package_pending = '',
					package_uninstalled = '',
				},
			},
		})

		require('neodev').setup()

		require('mason-lspconfig').setup({
			ensure_installed = tools.lsp,

			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = lspconfig_settings.on_attach,
						capabilities = lspconfig_settings.capabilities,
					})
				end,

				['lua_ls'] = function()
					lspconfig.lua_ls.setup({
						on_attach = lspconfig_settings.on_attach,
						capabilities = lspconfig_settings.capabilities,
						settings = {
							Lua = {
								completion = {
									callSnippet = 'Replace',
								},
								diagnostics = {
									globals = { 'vim' },
								},
								workspace = {
									library = {
										[vim.fn.expand('$VIMRUNTIME/lua')] = true,
										[vim.fn.stdpath('config') .. '/lua'] = true,
									},
								},
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,

				['rust_analyzer'] = function()
					require('rust-tools').setup({
						server = {
							on_attach = lspconfig_settings.on_attach,
							capabilities = lspconfig_settings.capabilities,
						},
					})
				end,
			},
		})

		require('mason-tool-installer').setup({
			ensure_installed = vim.list_extend(tools.formmaters, tools.linters),
			run_on_Start = true,
			start_delay = 200,
		})
	end,
}
