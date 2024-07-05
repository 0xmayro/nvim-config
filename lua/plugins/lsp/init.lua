local plugins = {}
local langs = require('plugins.lsp.langs')

for _, lang in pairs(langs) do
	if type(lang.plugins) == 'table' then
		table.insert(plugins, lang.plugins)
	end
end

return {
	{ import = 'plugins.lsp.setup' },
	plugins,
}
