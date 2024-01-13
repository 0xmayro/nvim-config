return {
	'nvimtools/none-ls.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'nvim-lua/plenary.nvim',
	},

	config = function()
		local null_ls = require('null-ls')
		local formatters = {
			'stylua',
			'prettierd',
			'clang_format',
		}

		local linters = {
			'eslint_d',
			'ruff',
		}

		local sources = {}

		for _, formatter in ipairs(formatters) do
			table.insert(sources, null_ls.builtins.formatting[formatter])
		end

		for _, linter in ipairs(linters) do
			table.insert(sources, null_ls.builtins.diagnostics[linter])
		end

		null_ls.setup({
			sources = sources,
		})
	end,
}
