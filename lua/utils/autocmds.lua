local lsp_group = vim.api.nvim_create_augroup('lspGroup', {})

vim.api.nvim_create_autocmd('BufWritePre', {
	group = lsp_group,
	callback = function()
		vim.lsp.buf.format({})
	end,
})
