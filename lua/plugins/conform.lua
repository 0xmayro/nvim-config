return {
	'stevearc/conform.nvim',
	event = 'BufWritePre',
	cmd = 'ConformInfo',
	config = function()
		require('conform').setup({
			formatters_by_ft = {
				lua = { 'stylua' },
				python = { 'isort', 'black' },
				javascript = { 'prettierd' },
				javascriptreact = { 'prettierd' },
				typescript = { 'prettierd' },
				typescriptreact = { 'prettierd' },
				css = { 'prettierd' },
				html = { 'prettierd' },
				svelte = { 'prettierd' },
			},
			format_on_save = {
				async = false,
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		})
	end,
}
