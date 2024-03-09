local functions = require('utils.functions')
local builtin = require('telescope.builtin')

local yank_group = vim.api.nvim_create_augroup('yank-group', { clear = true })
local lsp_group = vim.api.nvim_create_augroup('lsp-group', { clear = true })
local diagnostic_group = vim.api.nvim_create_augroup('diagnostic-group', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd('CursorHold', {
	group = diagnostic_group,
	pattern = '*',
	callback = function()
		functions.show_diagnostics()
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = lsp_group,
	callback = function(event)
		functions.lmap('gR', builtin.lsp_references, event, 'Goto references')
		functions.lmap('gD', builtin.lsp_definitions, event, 'Goto definitions')
		functions.lmap('D', builtin.lsp_type_definitions, event, 'Type definitions')
		functions.lmap('<leader>ca', vim.lsp.buf.code_action, event, 'Code actions')
		functions.lmap('<leader>rn', vim.lsp.buf.rename, event, 'Rename')
		functions.lmap('<leader>D', builtin.diagnostics, event, 'Diagnostics')
		functions.lmap('[d', vim.diagnostic.goto_prev, event, 'Go to previous diagnostic')
		functions.lmap(']d', vim.diagnostic.goto_next, event, 'Go to next diagnostic')
		functions.lmap('K', vim.lsp.buf.hover, event, 'Show hover info')
	end,
})
