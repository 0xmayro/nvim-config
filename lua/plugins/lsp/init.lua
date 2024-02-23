-- we use the Lazy syntax to install and configure the lsp plugins in this file
return {
	{ require('plugins.lsp.lspconfig') },
	{ require('plugins.lsp.mason') },
	{ require('plugins.lsp.conform') },
	{ require('plugins.lsp.cmp') },
}
