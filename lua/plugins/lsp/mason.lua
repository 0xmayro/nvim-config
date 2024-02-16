return {
	'williamboman/mason.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	cmd = 'Mason',
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
		require('mason').setup({
			ui = {
				icons = {
					package_installed = '',
					package_pending = '',
					package_uninstalled = '',
				},
			},
		})

		-- automatic lsp setup
		require('neodev').setup()

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
			handlers = {
				function(server_name) -- default handler (optional)
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
