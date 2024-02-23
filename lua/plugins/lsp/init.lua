-- we use the sytax to 'install' the lsp plugins in this file
return {
	{ require('plugins.lsp.lspconfig') },
	{ require('plugins.lsp.mason') },
	{ require('plugins.lsp.nonels') },
	{ require('plugins.lsp.cmp') },
}
