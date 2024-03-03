local M = {}

M.lmap = function(key, func, event, desc)
	vim.keymap.set('n', key, func, { buffer = event.buf, desc = 'LSP:' .. desc })
end

return M
