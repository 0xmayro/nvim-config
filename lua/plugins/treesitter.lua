return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'windwp/nvim-ts-autotag',
	},
	lazy = false,
	build = ':TSUpdate',
	config = function()
		local configs = require('nvim-treesitter.configs')

		configs.setup({
			ensure_installed = {
				'lua',
				'json',
				'vim',
				'vimdoc',
				'rust',
				'python',
				'javascript',
				'typescript',
				'svelte',
				'html',
				'css',
				'c',
			},
			sync_install = false,

			highlight = {
				enable = true,
				additional_regex_highlighting = false,
			},
			autotag = {
				enable = true,
			},
		})
	end,
}
