return {
	server = 'clangd',
	plugins = {
		{
			'p00f/clangd_extensions.nvim',
			ft = { 'c', 'cpp', 'h', 'hpp' },
			opts = {},
		},
	},
}
