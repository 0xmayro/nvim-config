return {
	'akinsho/toggleterm.nvim',
	lazy = false,
	version = '*',
	config = function()
		require('toggleterm').setup()
		local keymap = vim.keymap

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

		keymap.set('n', '<leader>tg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', {noremap = true, silent = true})
	end
}
