return {
	'mfussenegger/nvim-lint',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require('lint').linters_by_ft = {
			lua = { 'luacheck' },
			javascript = { 'eslint_d' },
			typescript = { 'eslint_d' },
			html = { 'eslint_d' },
			css = { 'eslint_d' },
			svelte = { 'eslint_d' },
		}
	end,
}
