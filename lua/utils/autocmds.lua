local lmap = require('utils.functions').lmap
local builtin = require('telescope.builtin')

local yank_group = vim.api.nvim_create_augroup('yank-group', { clear = true })
local lsp_group = vim.api.nvim_create_augroup('lsp-group', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = lsp_group,
	callback = function(event)
		lmap('gR', builtin.lsp_references, event, 'Goto references')
		lmap('gD', builtin.lsp_definitions, event, 'Goto definitions')
		lmap('D', builtin.lsp_type_definitions, event, 'Type definitions')
		lmap('<leader>ca', vim.lsp.buf.code_action, event, 'Code actions')
		lmap('<leader>rn', vim.lsp.buf.rename, event, 'Rename')
		lmap('<leader>D', builtin.diagnostics, event, 'Diagnostics')
		lmap('[d', vim.diagnostic.goto_prev, event, 'Go to previous diagnostic')
		lmap(']d', vim.diagnostic.goto_next, event, 'Go to next diagnostic')
		lmap('K', vim.lsp.buf.hover, event, 'Show hover info')
	end,
})
