vim.diagnostic.config({
	virtual_text = true,
	underline = true,
})

local hover_group = vim.api.nvim_create_augroup('diagonstic_hover', { clear = true })
vim.api.nvim_create_autocmd('CursorHold', {
	group = hover_group,
	callback = function()
		vim.diagnostic.open_float()
	end,
})
