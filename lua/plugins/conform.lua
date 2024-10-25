return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	cmd = 'ConformInfo',
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			python = { 'isort', 'ruff' },
			javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
			typescript = { 'prettierd', 'prettier', stop_after_first = true },
			typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
			html = { 'prettierd', 'prettier', stop_after_first = true },
			css = { 'prettierd', 'prettier', stop_after_first = true },
			svelte = { 'prettierd', 'prettier', stop_after_first = true },
		},
		format_on_save = {
			async = false,
			timeout_ms = 1000,
			lsp_fallback = true,
		},
	},
}
