local builtin = require('telescope.builtin')
local lsp_map = require('utils.keymap').lsp_map

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
		-- check windows
		for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
			if vim.api.nvim_win_get_config(winid).zindex then
				return
			end
		end

		-- window options
		vim.diagnostic.open_float({
			scope = 'cursor',
			focusable = false,
			close_events = {
				'CursorMoved',
				'CursorMovedI',
				'BufHidden',
				'InsertCharPre',
				'WinLeave',
			},
		})
	end,
})
vim.api.nvim_create_autocmd('LspAttach', {
	group = lsp_group,
	callback = function(event)
		lsp_map('gR', builtin.lsp_references, event, 'Goto references')
		lsp_map('gD', builtin.lsp_definitions, event, 'Goto definitions')
		lsp_map('D', builtin.lsp_type_definitions, event, 'Type definitions')
		lsp_map('<leader>ca', vim.lsp.buf.code_action, event, 'Code actions')
		lsp_map('<leader>rn', vim.lsp.buf.rename, event, 'Rename')
		lsp_map('<leader>D', builtin.diagnostics, event, 'Diagnostics')
		lsp_map('[d', vim.diagnostic.goto_prev, event, 'Go to previous diagnostic')
		lsp_map(']d', vim.diagnostic.goto_next, event, 'Go to next diagnostic')
		lsp_map('K', vim.lsp.buf.hover, event, 'Show hover info')
	end,
})
