-- we use the Lazy syntax to install and configure the lsp plugins in this file
return {
	{ require('plugins.lsp.lsp') },
	{ require('plugins.lsp.cmp') },
	{ require('plugins.lsp.conform') },
	{ require('plugins.lsp.fidget') }
}
