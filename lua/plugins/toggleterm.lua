return {
	'akinsho/toggleterm.nvim',
	lazy = false,
	version = '*',
	config = function()
		require('toggleterm').setup()
		local keymap = vim.keymap

		local Terminal = require('toggleterm.terminal').Terminal
		local lazygit = Terminal:new({
			cmd = 'lazygit',
			hidden = true,
			direction = 'float',
			float_opts = {
				border = 'double',
			},
		})

		local powershell_options = {
			shell = vim.fn.executable('pwsh') == 1 and 'pwsh' or 'powershell',
			shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
			shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
			shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
			shellquote = '',
			shellxquote = '',
		}

		for option, value in pairs(powershell_options) do
			vim.opt[option] = value
		end

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		-- keymaps
		keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
		keymap.set('n', '<leader>tg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true })

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
			keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
			keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
			keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
			keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
			keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
			keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
		end
		vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
	end,
}
