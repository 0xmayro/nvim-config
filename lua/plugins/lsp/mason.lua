return {
	'williamboman/mason.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		local lspconfig = require('lspconfig')
		local lsp_settings = require('util.lsp_settings')
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
			ensure_installed = { 'lua_ls', 'rust_analyzer', 'pyright', 'tsserver', 'svelte', 'html', 'cssls' },
		})

		-- automatic lsp setup
		require('neoconf').setup()

		for _, server in ipairs(require('mason-lspconfig').get_installed_servers()) do
			if server == 'lua_ls' then
				require('neodev').setup()

				lspconfig.lua_ls.setup({
					on_attach = lsp_settings.on_attach,
					capabilities = lsp_settings.capabilities,
					settings = {
						lua = {
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
			elseif server == 'rust_analyzer' then
				require('rust-tools').setup({
					server = {
						on_attach = lsp_settings.on_attach,
						capabilities = lsp_settings.capabilities,
					},
				})
			else
				lspconfig[server].setup({
					on_attach = lsp_settings.on_attach,
					capabilities = lsp_settings.capabilities,
				})
			end
		end
	end,
}
