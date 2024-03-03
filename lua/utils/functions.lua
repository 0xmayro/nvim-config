local M = {}

M.lmap = function(key, func, opts)
	vim.keymap.set('n', key, func, { buffer = opts.buf, desc = 'LSP:' .. opts.desc })
end

return M
