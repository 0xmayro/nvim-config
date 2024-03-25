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

		local nmap = require('utils.keymap').nmap
		nmap('<leader>sf', builtin.find_files, 'Search files in cwd')
		nmap('<leader>s/', builtin.current_buffer_fuzzy_find, 'Search in current buffer')
		nmap('<leader>sr', builtin.oldfiles, 'Search recent files')
		nmap('<leader>sg', builtin.git_files, 'Search git files')
		nmap('<leader>ss', builtin.live_grep, 'Search string in cwd')
		nmap('<leader>sb', builtin.buffers, 'Search in open buffers')
	end,
}
