return {
	'https://github.com/NvChad/nvim-colorizer.lua',
	event = { 'BufReadPost', 'BufNewFile' },
	opts = {
		user_default_options = {
			mode = 'background',
			names = true,
			RGB = true,
			RRGGBB = true,
			RRGGBAA = false,
			css = true,
			tailwind = true,
		},
	},
}
