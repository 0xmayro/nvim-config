return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priorty = 1000,
	lazy = false,
	config = function() 
		vim.cmd('colorscheme catppuccin-macchiato')
	end
}
