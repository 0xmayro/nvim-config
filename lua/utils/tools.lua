local M = {}

M.lsp = {
	'lua_ls',
	'rust_analyzer',
	'pyright',
	'tsserver',
	'svelte',
	'html',
	'cssls',
	'clangd',
}

M.formatters = {
	'stylua',
	'prettierd',
	'prettier',
	'black',
	'isort',
}

M.linters = {
	'eslint_d',
	'ruff',
}

return M
