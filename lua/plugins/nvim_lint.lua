return {
	'mfussenegger/nvim-lint',
	event = 'BufWritePre',
	config = function()
		require('lint').linters_by_ft = {
			python = { 'ruff' },
			javascript = { 'eslint_d' },
			javascriptreact = { 'eslint_d' },
			typescript = { 'eslint_d' },
			typescriptreact = { 'eslint_d' },
			html = { 'eslint_d' },
			css = { 'eslint_d' },
			svelte = { 'eslint_d' },
		}
	end,
}
