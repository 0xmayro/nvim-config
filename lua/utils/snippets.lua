-- custom luasnip snippets

local ls = require('luasnip')
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_snippet

ls.add_snippets('html', {
	s(
		'html5',
		fmt(
			[[
	<!DOCTYPE html>
	<html lang = "{}">
		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content = "width=device-width, initial-scale=1">
			<title>Untitled</title>
			<link href="{}" rel="stylesheet">
		</head>
		<body>
		{}
		</body>
	]],
			{
				i(1, 'en'),
				i(2),
				i(3),
			}
		)
	),
})
