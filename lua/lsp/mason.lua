return {
	'williamboman/mason.nvim',
	lazy = false,
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		local lspconfig = require('lspconfig')
		local lspconfig_settings = require('lsp.lspconfig')

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

			handlers = {
				function (server_name)
        	lspconfig[server_name].setup {
						on_attach = lspconfig_settings.on_attach,
						capabilities = lspconfig_settings.capabilities,
					}
        end,
				['lua_ls'] = function()
          require('neodev').setup()
					lspconfig.lua_ls.setup {

            	settings = {
                Lua = {
                	diagnostics = {
                  	globals = { 'vim' }
                  },
                },
              },
          	}
        end,
			},
		})

	end,
}
