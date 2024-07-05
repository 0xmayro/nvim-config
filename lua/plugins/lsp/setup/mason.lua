return {
	'williamboman/mason.nvim',
	cmd = { 'Mason', 'MasonLog', 'MasonToolsInstall', 'MasonToolsClean' },
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		local langs = require('plugins.lsp.langs')

		require('mason').setup()
		local ensure_installed = {
			'stylua',
			'goimports',
			'prettierd',
			'ruff',
			'prettier',
			'isort',
			'shfmt',
		}

		local servers_to_install = {}
		for _, lang in pairs(langs) do
			if not lang.manual_install then
				if type(lang.server) == 'table' then
					for _, server in ipairs(lang.server) do
						table.insert(servers_to_install, server)
					end
				else
					table.insert(servers_to_install, lang.server)
				end
			end
		end
		ensure_installed = vim.list_extend(ensure_installed, servers_to_install)
		require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
	end,
}
