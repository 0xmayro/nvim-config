return {
	'stevearc/conform.nvim',
	event = 'BufWritePre',
	config = function()
		require('conform').setup({
			formmaters_by_ft = {
				lua = { 'stylua' },
				python = { 'isort', 'black' },
				javascript = { 'prettierd' },
				typescript = { 'prettierd' },
				css = { 'prettierd' },
				html = { 'prettierd' },
				svelte = { 'prettierd' },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
