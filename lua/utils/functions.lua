local M = {}

M.show_diagnostics = function()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_get_config(winid).zindex then
			return
		end
	end
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
end

M.nmap = function(lhs, rhs, desc)
	vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true, desc = desc })
end

M.lsp_map = function(key, func, event, desc)
	vim.keymap.set('n', key, func, { buffer = event.buf, desc = 'LSP:' .. desc })
end

return M
