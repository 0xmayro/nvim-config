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
		functions.lsp_map('gR', builtin.lsp_references, event, 'Goto references')
		functions.lsp_map('gD', builtin.lsp_definitions, event, 'Goto definitions')
		functions.lsp_map('D', builtin.lsp_type_definitions, event, 'Type definitions')
		functions.lsp_map('<leader>ca', vim.lsp.buf.code_action, event, 'Code actions')
		functions.lsp_map('<leader>rn', vim.lsp.buf.rename, event, 'Rename')
		functions.lsp_map('<leader>D', builtin.diagnostics, event, 'Diagnostics')
		functions.lsp_map('[d', vim.diagnostic.goto_prev, event, 'Go to previous diagnostic')
		functions.lsp_map(']d', vim.diagnostic.goto_next, event, 'Go to next diagnostic')
		functions.lsp_map('K', vim.lsp.buf.hover, event, 'Show hover info')
	end,
})
