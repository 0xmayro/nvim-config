return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	cmd = { 'ConformInfo' },
	config = function()
		require('conform').setup({
			formatters_by_ft = {
				lua = { 'stylua' },
				python = { 'isort', 'black' },
				javascript = { 'prettierd' },
			},
			format_on_save = {
				timeout = 1000,
				lsp_fallback = true,
			},
		})

		local keymap = vim.keymap
		keymap.set('n', '<leader>f', function()
			require('conform').format({ lsp_fallback = true, timeout = 1000 })
		end)
	end,
}
