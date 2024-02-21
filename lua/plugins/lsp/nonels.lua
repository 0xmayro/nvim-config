return {
	'nvimtools/none-ls.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'nvim-lua/plenary.nvim',
	},

	config = function()
		local null_ls = require('null-ls')
		local tools = require('utils.tools')

		local sources = {}

		for _, formatter in ipairs(tools.formmaters) do
			table.insert(sources, null_ls.builtins.formatting[formatter])
		end

		for _, linter in ipairs(tools.linters) do
			table.insert(sources, null_ls.builtins.diagnostics[linter])
		end

		null_ls.setup({
			sources = sources,
		})
	end,
}
