return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		local lspconfig = require('lspconfig')
		local langs = require('plugins.lsp.langs')

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		if pcall(require, 'cmp_nvim_lsp') then
			capabilities = vim.tbl_deep_extend(
				'force',
				vim.lsp.protocol.make_client_capabilities(),
				require('cmp_nvim_lsp').default_capabilities(capabilities)
			)
		end

		for _, lang in pairs(langs) do
			local config = {
				capabilities = capabilities,
			}

			if lang.settings then
				config = vim.tbl_deep_extend('force', config, lang.settings)
			end

			if type(lang.server) == 'table' then
				for _, server in ipairs(lang.server) do
					lspconfig[server].setup(config)
				end
			else
				lspconfig[lang.server].setup(config)
			end
		end
	end,
}
