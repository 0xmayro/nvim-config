return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPost', 'BufNewFile' },
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',

		-- language spacific plugins
		'simrat39/rust-tools.nvim',
		'floke/neodev.nvim',
	},
	config = function()
		local lspconfig = require('lspconfig')
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

			opts.desc = 'Smart rename'
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
			keymap.set('n', 'K', vim.lsp.buf.hover, opts)

			opts.desc = 'Restart LSP'
			keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		-- automatic lsp setup
		for _, server in ipairs(require('mason-lspconfig').get_installed_servers()) do
			if server == 'lua_ls' then
				require('neodev').setup()

				lspconfig.lua_ls.setup({
					on_attach = on_attach,
					capabilities = capabilities,
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
						on_attach = on_attach,
						capabilities = capabilities,
					},
				})
			else
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end
	end,
}
