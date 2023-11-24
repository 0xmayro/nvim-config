return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	config = function()
		require('conform').setup({
			formatters_by_ft = {
				lua = { 'stylua' },
				python = { 'isort', 'black' },
				javascript = { 'prettierd' },
			},
			format_on_save = {
				timeout = 500,
				lsp_fallback = true,
			},
		})
	end,
}
