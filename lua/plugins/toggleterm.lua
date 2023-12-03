return {
	'akinsho/toggleterm.nvim',
	lazy = false,
	version = '*',
	config = function()
		require('toggleterm').setup()

		local Terminal = require('toggleterm.terminal').Terminal
		local lazygit = Terminal:new({
			cmd = 'lazygit',
			hidden = true,
			direction = 'float',
			float_opts = {
				border = 'double',
			},
		})

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		-- keymaps
		local keymap = vim.keymap
		keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
		keymap.set('n', '<leader>tg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true })
	end,
}
