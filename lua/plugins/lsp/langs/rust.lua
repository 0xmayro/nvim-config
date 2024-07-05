return {
	server = 'rust_analyzer',
	plugins = {
		{
			'saecki/crates.nvim',
			tag = 'stable',
			event = { 'BufRead Cargo.toml' },
			opts = {},
		},
	},
}
