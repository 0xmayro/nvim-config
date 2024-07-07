return {
	'mfussenegger/nvim-dap',
	event = 'VeryLazy',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
		'mfussenegger/nvim-dap-python',
		'leoluz/nvim-dap-go',
		'folke/neodev.nvim',
	},
	config = function()
		local dap = require('dap')
		local dapui = require('dapui')
		local nmap = require('utils.keymap').nmap

		dapui.setup()
		require('dap-python').setup()
		require('dap-go').setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.after.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.after.event_exited.dapui_config = function()
			dapui.close()
		end

		nmap('<F5>', dap.continue)
		nmap('<F10>', dap.step_over)
		nmap('<F11>', dap.step_into)
		nmap('<F12>', dap.step_out)
		nmap('<Leader>b', dap.toggle_breakpoint)
	end,
}
