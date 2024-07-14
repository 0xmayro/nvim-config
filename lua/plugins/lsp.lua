return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'folke/lazydev.nvim',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		local lspconfig = require('lspconfig')

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		if pcall(require, 'cmp_nvim_lsp') then
			capabilities = vim.tbl_deep_extend(
				'force',
				vim.lsp.protocol.make_client_capabilities(),
				require('cmp_nvim_lsp').default_capabilities(capabilities)
			)
		end

		require('lazydev').setup()

		require('mason').setup({
			ui = {
				icons = {
					package_installed = '',
					package_pending = '',
					package_uninstalled = '',
				},
			},
		})

		local servers = {
			jedi_language_server = true,
			gopls = true,
			rust_analyzer = true,
			taplo = true,
			clangd = true,
			cssls = true,
			html = true,
			svelte = true,
			emmet_language_server = true,
			vuels = true,

			gdscript = {
				manual_install = true,
			},
			tsserver = {
				settings = {
					formatexpr = false,
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = 'Replace',
						},
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = { 'vim' },
							disable = { 'missing-fields' },
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
			},
		}

		local servers_to_install = vim.tbl_filter(function(key)
			local server = servers[key]
			if type(server) == 'table' then
				return not server.manual_install
			else
				return server
			end
		end, vim.tbl_keys(servers))

		local ensure_installed = {
			'stylua',
			'goimports',
			'prettierd',
			'ruff',
			'prettier',
			'isort',
			'shfmt',
		}

		vim.list_extend(ensure_installed, servers_to_install)
		require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

		for server, config in pairs(servers) do
			if config == true then
				config = {}
			end
			config = vim.tbl_deep_extend('force', {}, {
				capabilities = capabilities,
			}, config)

			lspconfig[server].setup(config)
		end
	end,
}
