return {
	server = 'lua_ls',
	settings = {
		Lua = {
			completion = {
				callSnippet = 'Replace',
			},
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
				disable = { 'missing-fields' },
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.stdpath('config') .. '/lua'] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
