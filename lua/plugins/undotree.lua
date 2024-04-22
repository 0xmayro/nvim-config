return {
	'mbbill/undotree',
	lazy = false,
	config = function()
		local nmap = require('utils.keymap').nmap
		nmap('<leader>tu', vim.cmd.UndotreeToggle, 'toggle UndoTree')
	end,
}
