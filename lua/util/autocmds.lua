local lint_group = vim.api.nvim_create_augroup('linting', { clear = false })

vim.api.nvim_create_autocmd(lint_group, {
	callback = function()
		require('lint').try_lint()
	end,
})
