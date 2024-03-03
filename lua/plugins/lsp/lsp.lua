return {
	'neovim/nvim-lspconfig',
	event = { 'BufFilePost', 'BufFilePre', 'BufNewFile' },
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		'folke/neodev.nvim',
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local lspconfig = require('lspconfig')
		local tools = require('utils.tools')
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			opts.desc = 'Show LSP references'
			keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

			opts.desc = 'Go to declaration'
			keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

			opts.desc = 'Show LSP definitions'
			keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

			opts.desc = 'Show LSP implementations'
			keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

			opts.desc = 'Show LSP type definitions'
			keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

			opts.desc = 'See available code actions'
			keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

			opts.desc = 'Rename'
			keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

			opts.desc = 'Show buffer diagnostics'
			keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

			opts.desc = 'Show line diagnostics'
			keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

			opts.desc = 'Go to previous diagnostic'
			keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

			opts.desc = 'Go to next diagnostic'
			keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

			opts.desc = 'Show documentation for what is under cursor'
			keymap.set({ 'n', 'v' }, 'K', vim.lsp.buf.hover, opts)

			opts.desc = 'Restart LSP'
			keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(),
			require('cmp_nvim_lsp').default_capabilities(capabilities))

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
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,

				['lua_ls'] = function()
					lspconfig.lua_ls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							Lua = {
								completion = {
									callSnippet = 'Replace',
								},
								diagnostics = {
									globals = { 'vim' },
									disable = {
										'missing-fields',
									}
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
			}
		})
		require('mason-tool-installer').setup({
			ensure_installed = tools.formmaters,
			run_on_Start = true,
			start_delay = 200,
		})
	end,
}
