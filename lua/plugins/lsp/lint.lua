return {
	'mfussenegger/nvim-lint',
	event = { 'BufWritePost', 'BufReadPre' },
	config = function()
		require('lint').setup({
			linters_by_ft = {
				lua = { 'luacheck' },
				javascript = { 'eslint_d' },
				typescript = { 'eslint_d' },
			},
		})

		vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
			callback = function()
				require('lint').try_lint()
			end,
		})
	end,
}
