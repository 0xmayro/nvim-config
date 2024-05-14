return {
	'L3MON4D3/LuaSnip',
	version = '2.*',
	build = 'make install_jsregexp',
	event = 'VeryLazy',
	config = function()
		require('luasnip.config').set_config({})
		require('luasnip.loaders.from_lua').load({ paths = { vim.fn.stdpath('config') .. '/snippets' } })
	end,
}
