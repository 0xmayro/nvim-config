return {
	'stevearc/conform.nvim',
	event = 'BufWritePre',
	cmd = 'ConformInfo',
	config = function()
		require('conform').setup({
			formatters_by_ft = {
				lua = { 'stylua' },
				python = { 'isort', 'black' },
				javascript = { { 'prettierd', 'prettier' } },
				javascriptreact = { { 'prettierd', 'prettier' } },
				typescript = { { 'prettierd', 'prettier' } },
				typescriptreact = { { 'prettierd', 'prettier' } },
				html = { { 'prettierd', 'prettier' } },
				css = { { 'prettierd', 'prettier' } },
				svelte = { { 'prettierd', 'prettier' } },
			},
			format_on_save = {
				async = false,
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		})
	end,
}
