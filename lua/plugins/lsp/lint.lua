return {
	'mfussenegger/nvim-lint',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require('lint').linters_by_ft = {
			lua = { 'luacheck' },
			javascript = { 'eslint_d' },
			typescript = { 'eslint_d' },
			python = { 'ruff' },
		}

		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'insertleave' }, {
			callback = function()
				require('lint').try_lint()
			end,
		})
	end,
}
