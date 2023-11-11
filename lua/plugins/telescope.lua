return {
	'nvim-telescope/telescope.nvim',
	lazy = false,
	tag = '0.1.4',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('telescope').setup()
		require('telescope').load_extension('fzf')
		local builtin = require('telescope.builtin')

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set('n', '<leader>ff', builtin.find_files, opts)
		keymap.set('n', '<leader>fr', builtin.oldfiles, opts)
		keymap.set('n', '<leader>fg', builtin.git_files, opts)
		keymap.set('n', '<leader>fs', builtin.live_grep, opts)
		keymap.set('n', '<leader>fb', builtin.buffers, opts)

	end
}
