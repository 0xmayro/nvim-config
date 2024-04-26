local M = {}

M.nmap = function(lhs, rhs, desc)
	vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true, desc = desc })
end

M.imap = function(lhs, rhs, desc)
	vim.keymap.set('i', lhs, rhs, { desc = desc })
end

M.vmap = function(lhs, rhs, desc)
	vim.keymap.set('v', lhs, rhs, { desc = desc })
end

M.lsp_map = function(key, func, event, desc)
	vim.keymap.set('n', key, func, { buffer = event.buf, desc = 'LSP:' .. desc })
end

return M
