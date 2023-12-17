return {
	'akinsho/toggleterm.nvim',
	lazy = false,
	version = '*',
	config = function()
		local is_win32 = vim.fn.has('win32')
		if is_win32 == 1 then
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
		end

		require('toggleterm').setup({
			size = 20,
			shade_terminals = true,
			start_in_insert = true,
			persist_size = true,
		})

		local Terminal = require('toggleterm.terminal').Terminal
		vim.api.nvim_create_user_command('Lazygit', function()
			local lazygit = Terminal:new({ cmd = 'lazygit', hidden = false, direction = 'float' })
			lazygit:toggle()
		end, {})

		-- keymaps
		local keymap = vim.keymap

		keymap.set('n', '<leader>tg', '<cmd>Lazygit<CR>', { noremap = true, silent = true })
		keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { noremap = true, silent = true })
		keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true })

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
			vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
			vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
	end,
}
