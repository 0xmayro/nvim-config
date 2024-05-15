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
				'python',
				'json',
				'vim',
				'vimdoc',
				'rust',
				'go',
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
				additional_regex_highlighting = true,
			},
			autotag = {
				enable = true,
			},
		})
	end,
}
