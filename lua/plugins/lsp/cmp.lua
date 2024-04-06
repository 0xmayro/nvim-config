return {
	'hrsh7th/nvim-cmp',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'onsails/lspkind.nvim',
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local lspkind = require('lspkind')

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			completion = {
				completeopt = 'menu, menuone, noinsert',
			},

			mapping = cmp.mapping.preset.insert({
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-l>'] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { 'i', 's' }),
				['<C-h>'] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { 'i', 's' }),
			}),

			formatting = {
				format = lspkind.cmp_format({
					mode = 'symbol_text',
				}),
				menu = {
					buffer = '[buf]',
					nvim_lsp = '[lsp]',
					nvim_lua = '[api]',
					path = '[path]',
					luasnip = '[snip]',
				},
			},

			sources = cmp.config.sources({
				{ name = 'nvim_lua' },
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
				{ name = 'path' },
			}),
		})
	end,
}
